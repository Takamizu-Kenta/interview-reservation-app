class AddGradeToReservations < ActiveRecord::Migration[7.0]
  def up
    add_column :reservations, :grade, :integer
  end

  def down
    remove_column :reservations, :grade, :integer
  end
end
