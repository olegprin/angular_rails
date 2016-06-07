class AddRoleToUser < ActiveRecord::Migration
  def change
   add_column :users, :role, :string
   add_column :users, :admin, :boolean, default: false
  end
end
