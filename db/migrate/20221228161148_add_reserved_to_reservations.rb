class AddReservedToReservations < ActiveRecord::Migration[7.0]
  def up
    add_column :reservations, :reserved, :boolean
  end

  def down
    remove_column :reservations, :reserved, :boolean
  end
end
