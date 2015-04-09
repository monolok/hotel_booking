class Booking < ActiveRecord::Base
	belongs_to :room
	has_many :date_bookings

    validates :length, :presence => true

    validate :dates_are_available

    def dates_are_available
     if Room.find(self.room_id).bookings.exists?
        self.errors.add(:base, 'Date already taken')
     end
    end


end
