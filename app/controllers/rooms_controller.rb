class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :edit, :update, :destroy]
  #before_save :verify_dates, only: [:create_book_now]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all
  end

  def book_now
    @room = Room.find(params[:room_id])
    @book_room = Booking.new
  end

  def create_book_now
    @room = Room.find(params[:room_id])
    booking = @room.bookings.build(booking_params)
   
    if booking.save  #Save booking in DB if model validation are OK
      booking.update(end_date: booking.start_date + booking.length.days)
      flash[:notice] = "Booking done"
      redirect_to root_path
    else
      flash[:error] =  booking.errors.full_messages.first if booking.errors.any?
      redirect_to room_book_now_path(@room.id)
    end

  end


  # GET /rooms/1
  # GET /rooms/1.json
  def show
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    @room = Room.new(room_params)

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, notice: 'Room was successfully created.' }
        format.json { render :show, status: :created, location: @room }
      else
        format.html { render :new }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name, :type, :price)
    end

    def booking_params
      params.require(:post).permit(:start_date, :length)
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

end
