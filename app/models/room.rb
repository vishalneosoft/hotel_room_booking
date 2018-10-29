class Room < ActiveRecord::Base
  enum room_type: { "Deluxe Rooms": 0, "Luxury Rooms": 1, "Luxury suites": 2, "Presidential Suites": 3 }

  has_and_belongs_to_many :bookings

  def self.available_rooms(start_date, last_date, room_type = nil)
    if Booking.excluded_ids(start_date, last_date)
      self.where("room_type = ? AND id NOT IN (?)", Room.room_types[room_type], Booking.excluded_ids(start_date, last_date))
    else
      self.where("room_type = ?", Room.room_types[room_type])
    end
  end

end
