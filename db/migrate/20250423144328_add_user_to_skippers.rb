class AddUserToSkippers < ActiveRecord::Migration[7.2]
  def change
    add_reference :skippers, :user, foreign_key: true
  end
end
