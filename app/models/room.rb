class Room < ActiveRecord::Base
	has_many :bookings
	#accepts_nested_attributes_for :bookings, reject_if: :all_blank, allow_destroy: true
end
