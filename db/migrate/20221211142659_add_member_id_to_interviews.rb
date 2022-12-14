class AddMemberIdToInterviews < ActiveRecord::Migration[7.0]
  def up
    add_column :interviews, :member_id, :integer
  end

  def down
    remove_column :interviews, :member_id, :integer
  end
end
