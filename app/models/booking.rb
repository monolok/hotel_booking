class Booking < ActiveRecord::Base
	belongs_to :room

    validates :length, :presence => true

    validate :dates_are_available

    def dates_are_available
        room = Room.find(self.room_id)
        # if Room.find(self.room_id).bookings.exists?
        #    self.errors.add(:base, 'Date already taken')
        # end
        conditions = []
        conditions << '(start_date >= :new_start_date AND end_date >= :new_end_date)'
        conditions << '(start_date >= :new_start_date AND end_date <= :new_end_date)'
        conditions << '(end_date BETWEEN :new_start_date AND :new_end_date)'
        conditions << '(start_date <= :new_start_date AND end_date >= :new_end_date)'
        if room.bookings.where(conditions.join(' OR '), new_start_date: self.start_date, new_end_date: self.end_date).exists?
            self.errors.add(:base, 'Date already taken')
            return false
        end
    end

  # def dates_are_available
  #   conditions = []
  #   conditions << '(end_date BETWEEN :new_start_date AND :new_end_date)'
  #   conditions << '(start_date < :new_start_date AND end_date > :new_end_date)'
  #   if Booking.where(conditions.join(' OR '), new_start_date: self.start_date, new_end_date: self.end_date).exists?
  #     self.errors.add(:base, 'Date already taken')
  #     return false
  #   end
  # end

end