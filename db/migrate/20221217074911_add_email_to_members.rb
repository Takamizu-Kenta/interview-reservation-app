class AddEmailToMembers < ActiveRecord::Migration[7.0]
  def up
    add_column :members, :email, :string
  end

  def down
    remove_column :members, :email, :string
  end
end
