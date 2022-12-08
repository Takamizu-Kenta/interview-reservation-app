class AddIndexToAdminUsersEmail < ActiveRecord::Migration[7.0]
  def change
    add_index :admin_users, :email, unique: true
  end
end
