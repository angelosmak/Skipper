class AddRoleToSkippers < ActiveRecord::Migration[7.2]
  def change
    add_column :skippers, :role, :string, default: "skipper"
  end
end
