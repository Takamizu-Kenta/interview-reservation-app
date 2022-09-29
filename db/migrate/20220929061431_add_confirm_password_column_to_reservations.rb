class AddConfirmPasswordColumnToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :confirm_password, :string
  end
end
