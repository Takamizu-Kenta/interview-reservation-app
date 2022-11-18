class AddEmailColumnToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :email, :string
    add_index :reservations, [:email], unique: true
  end
end
