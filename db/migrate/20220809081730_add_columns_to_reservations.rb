class AddColumnsToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :name, :string
    add_column :reservations, :affiliation, :string
    add_column :reservations, :day, :date
    add_column :reservations, :time, :string
    add_column :reservations, :start_date, :datetime
  end
end
