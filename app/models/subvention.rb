class Subvention < ApplicationRecord
  has_many :subvention_requests

  def date_ok?
    Date.today >= start_date && Date.today <= end_date
  end
end
