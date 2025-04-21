class AddContactInfoToSkippers < ActiveRecord::Migration[7.2]
  def change
    add_column :skippers, :phone, :string
    add_column :skippers, :email, :string
  end
end
