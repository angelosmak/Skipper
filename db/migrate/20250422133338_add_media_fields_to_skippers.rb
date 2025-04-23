class AddMediaFieldsToSkippers < ActiveRecord::Migration[7.2]
  def change
    add_column :skippers, :image_url, :string
    add_column :skippers, :video_url, :string
    add_column :skippers, :cv_url, :string
  end
end
