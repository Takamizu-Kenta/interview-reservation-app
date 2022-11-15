class RemoveColumnToReservationConfirmPassword < ActiveRecord::Migration[7.0]
  def up
    remove_column :reservations, :confirm_password
      end

  def down
    add_column :reservations, :confirm_password, :string
  end
end
