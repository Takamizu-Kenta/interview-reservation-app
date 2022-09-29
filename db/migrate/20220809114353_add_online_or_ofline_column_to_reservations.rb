class AddOnlineOrOflineColumnToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :online_or_offline, :string
  end
end
