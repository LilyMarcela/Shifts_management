class RemoveIndexRoleIdFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_index :role_id, name: "index_users_on_role_id"
  end
end
