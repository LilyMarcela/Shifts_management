class RemoveUsersFkFromRoles < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :users, :roles
  end
end
