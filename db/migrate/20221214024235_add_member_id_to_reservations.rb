class AddMemberIdToReservations < ActiveRecord::Migration[7.0]
  def up
    add_column :reservations, :member_id, :integer
  end

  def down
    remove_column :reservations, :member_id, :integer
  end
end
