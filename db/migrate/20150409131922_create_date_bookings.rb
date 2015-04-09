class CreateDateBookings < ActiveRecord::Migration
  def change
    create_table :date_bookings do |t|
      t.datetime :date_booking
      t.integer :booking_id
      t.timestamps null: false
    end
  end
end
