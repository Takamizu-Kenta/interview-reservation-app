class AddMeetingUrlToReservations < ActiveRecord::Migration[7.0]
  def up
    add_column :reservations, :meeting_url, :string
  end

  def down
    remove_column :reservations, :meeting_url, :string
  end
end
