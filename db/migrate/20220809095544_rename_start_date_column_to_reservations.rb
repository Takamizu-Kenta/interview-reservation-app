class RenameStartDateColumnToReservations < ActiveRecord::Migration[7.0]
  def change
    rename_column :reservations, :start_date, :start_time
  end
end
