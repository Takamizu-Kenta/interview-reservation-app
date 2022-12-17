class ChangeDataOnlineOrOfflineToReservation < ActiveRecord::Migration[7.0]
  def up
    # rubocop:disable Rails/BulkChangeTable
    change_column :reservations, :online_or_offline, "integer USING CAST(online_or_offline AS integer)", comment: "実施形式"
  end

  def down
    change_column :reservations, :online_or_offline, "character varying USING CAST(online_or_offline AS character varying)", comment: "実施形式"
  end
end
