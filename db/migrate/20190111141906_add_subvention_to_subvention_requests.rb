class AddSubventionToSubventionRequests < ActiveRecord::Migration[5.2]
  def change
    add_reference :subvention_requests, :subvention, foreign_key: true
  end
end
