class SubventionRequest < ApplicationRecord
  belongs_to :subvention

  validates :email, format: { with: %r(\A[^\s\/,:!]+@[^\s,:!\/]+\.[a-zA-Z]{2}[a-zA-Z]?\z), \
                              message: "L'adresse email doit être valide." }
  validate :amount_max
  validates :justif_path, presence: { message: "Veuillez fournir un justificatif SVP" }
  validate :date

  mount_uploader :justif_path, JustifUploader

  private

  def total_amount_asked
    query = "SELECT sum(amount_asked)
             FROM subvention_requests
             INNER JOIN subventions ON subvention_requests.subvention_id = subventions.id
             WHERE email = '#{email}'
             AND subventions.id = #{subvention.id}
             "

    results = ActiveRecord::Base.connection.execute(query)
    results[0]["sum"] || 0
  end

  def amount_max
    if amount_asked.nil? || amount_asked.zero?
      errors.add(:amount_asked, "Veuillez saisir un montant non nul SVP")
    elsif amount_asked.negative?
      errors.add(:amount_asked, "Veuillez saisir un montant positif SVP")
    elsif total_amount_asked + amount_asked > subvention.amount
      errors.add(:amount_asked, "Le montant total demandé (#{(total_amount_asked + amount_asked) / 100}€, \
      demandes précédentes incluses) ne peut excéder le montant total de la subvention")
    end
  end

  def date
    errors[:base] << "Time range" unless subvention.date_ok?
  end
end
