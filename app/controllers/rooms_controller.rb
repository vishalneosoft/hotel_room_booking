class RoomsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :check_availability]
  before_action :set_room, only: [:show, :edit, :update, :destroy]

  def index
    @rooms = Room.all
  end

  def show
    @booking = Booking.new(room_type: @room.room_type)
  end

  def check_availability
    @errors = []
    if check_date_range(params[:check_in], params[:check_out])
      return false
    elsif params[:room_type].empty?
      @deluxe = Room.available_rooms(params[:check_in], params[:check_out], 'Deluxe Rooms').count
      @lux_room = Room.available_rooms(params[:check_in], params[:check_out], 'Luxury Rooms').count
      @lux_suite = Room.available_rooms(params[:check_in], params[:check_out], 'Luxury suites').count
      @pres_suite = Room.available_rooms(params[:check_in], params[:check_out], 'Presidential Suites').count
    else
      @rooms = Room.available_rooms(params[:check_in], params[:check_out], params[:room_type]).count
    end
    respond_to do |format|
      format.js
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_room
    @room = Room.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def room_params
    params.require(:room).permit(:price, :room_no, :room_type)
  end

  def check_date_range(start_date, last_date)
    if Date.today > start_date.to_date
      @errors.push("check in date should be greater or equal to today's date")
    elsif Date.today + 6.months < start_date.to_date
      @errors.push("Check in date should be smaller than 6 months")
    elsif Date.today + 6.months < last_date.to_date
      @errors.push("Check out date should be smaller than 6 months")
    elsif last_date.to_date <= start_date.to_date
      @errors.push("Check out date should be greater than Check in Date")
    end
  end
end
