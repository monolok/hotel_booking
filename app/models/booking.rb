class Booking < ActiveRecord::Base
	belongs_to :room
	has_many :date_bookings

	validate :validate_existing_dates

	def validate_existing_dates
		if date_bookings.exists?
			errors.add(:base, "Date not available")
        	redirect_to room_book_now_path(room_id)
		end
	end
end
    # def verify_dates
    #   @room.bookings.each do |b|
    #     if not b.empty?
    #       errors.add(:base, "Date not available")
    #       redirect_to room_book_now_path(@room.id)
    #     else
    #     end
    #     #b.date_bookings.date_booking
    #   end
    #     date_bookings.empty?
    # end