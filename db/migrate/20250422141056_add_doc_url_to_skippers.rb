class AddDocUrlToSkippers < ActiveRecord::Migration[7.2]
  def change
    add_column :skippers, :doc_url, :string
  end
end
