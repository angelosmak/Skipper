class CreateSkippers < ActiveRecord::Migration[7.2]
  def change
    create_table :skippers do |t|
      t.string :name
      t.text :bio
      t.string :video
      t.string :cv
      t.string :docs

      t.timestamps
    end
  end
end
