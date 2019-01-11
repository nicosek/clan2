class CreateSubventionRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :subvention_requests do |t|
      t.string :email
      t.string :justif_path
      t.integer :amount_asked

      t.timestamps
    end
  end
end
