class AddIndexToMembersEmail < ActiveRecord::Migration[7.0]
  def change
    add_index :members, :email, unique: true
  end
end
