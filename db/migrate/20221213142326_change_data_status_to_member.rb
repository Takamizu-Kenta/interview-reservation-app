class ChangeDataStatusToMember < ActiveRecord::Migration[7.0]
  def up
    # rubocop:disable Rails/BulkChangeTable
    change_column :members, :status, "integer USING CAST(faculty_department AS integer)", comment: "ステータス"
  end

  def down
    change_column :members, :status, "character varying USING CAST(faculty_department AS character varying)", comment: "ステータス"
  end
end
