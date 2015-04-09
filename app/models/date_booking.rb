class DateBooking < ActiveRecord::Base
	belongs_to :booking
 	
	  # def booking_dates_not_available
	  #   if self.date_booking.exists?
	  #   	booking= Booking.find(self.booking_id)
	  #   	booking.delete
	  #   	redirect_to room_book_now_path(booking.room_id)
	  #   	flash[:error] = "Date not available"
	  #   end
	  # end


end
