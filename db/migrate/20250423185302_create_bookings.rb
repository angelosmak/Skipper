class CreateBookings < ActiveRecord::Migration[7.2]
  def change
    create_table :bookings do |t|
      t.references :skipper, null: false, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
