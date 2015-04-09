class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.integer :length
      t.integer :room_id

      t.timestamps null: false
    end
  end
end
