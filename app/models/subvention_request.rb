class SubventionRequest < ApplicationRecord
  belongs_to :subvention

  def total_amount_asked
    # SubventionRequest.where(email: self[:email]).sum(:amount_asked)
    100_000
  end

  validates :email, format: { with: %r(\A[^\s\/,:!]+@[^\s,:!\/]+\.[a-zA-Z]{2}[a-zA-Z]?\z), \
                              message: "L'adresse email doit être valide." }
  validates :amount_asked, inclusion: { in: 1..100_000, \
                                        message: "Le montant du remboursement ne doit pas\
   dépasser celui autorisé par la subvention" }
  validates :justif_path, presence: true
end
