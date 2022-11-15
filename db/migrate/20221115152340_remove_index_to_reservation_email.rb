class RemoveIndexToReservationEmail < ActiveRecord::Migration[7.0]
  def change
    remove_index :reservations, :email
  end
end
