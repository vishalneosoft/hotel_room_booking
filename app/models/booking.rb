class Booking < ActiveRecord::Base
  enum room_type: { "Deluxe Rooms": 0, "Luxury Rooms": 1, "Luxury suites": 2, "Presidential Suites": 3 }

  belongs_to :room
  belongs_to :user

  before_validation :rooms_are_available
  before_create :add_room_total_cost

  validate :check_booking_date_range_between_six_months
  validates :user_id, :start_date, :last_date, presence: true
  validates_format_of :start_date, :last_date, :with => /\d{4}\-\d{2}\-\d{2}/, :message => "^Date must be in the following format: dd/mm/yyyy"


  def check_booking_date_range_between_six_months
    if dates_is_blank?
      errors.add(:start_date, "Please enter Check in date and Check out date")
    elsif Date.today > start_date.to_date
      errors.add(:start_date, "Check in date should be greater or equal to today's date")
    elsif Date.today + 6.months < start_date.to_date
      errors.add(:last_date, "Check in date should be smaller than 6 months")
    elsif Date.today + 6.months < last_date.to_date
      errors.add(:last_date, "Check out date should be smaller than 6 months")
    elsif last_date.to_date <= start_date.to_date
      errors.add(:last_date, "Check out date should be greater than Check in Date")
    end
  end

  # get the all the room_id which room are booked in between start_date and last_date
  def self.excluded_ids(start_date, last_date)
    existing_booking_ids = Booking.where("Date(start_date) < ? AND Date(last_date) > ? ", last_date, start_date).pluck(:room_id)
    if existing_booking_ids.blank?
      return false
    else
      return existing_booking_ids
    end
  end

  def rooms_are_available
    rooms = Room.available_rooms(start_date, last_date, room_type).limit(1)
    if rooms.length > 0
      self.room_id = rooms.first.id
    else
      errors.add(:number_of_person, "Rooms are not available #{room_type}")
    end
  end

  def dates_is_blank?
    if start_date.blank? || last_date.blank?
      return true
    end
  end

  def add_room_total_cost
    self.cost = (self.last_date - self.start_date).to_i * self.room.price
  end
end
