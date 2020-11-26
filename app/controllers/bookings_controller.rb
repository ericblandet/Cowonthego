class BookingsController < ApplicationController
  before_action :find_booking, only: [:show, :edit, :update, :destroy]

  def index
    @bookings = Booking.where(user_id: current_user)
  end

  def show
  end

  def new
    @workspace = Workspace.find(params[:workspace_id])
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.build(booking_params)
    @workspace = Workspace.find(params[:workspace_id])
    @booking.workspace = @workspace
    @booking.total_price = (@booking.end_date - @booking.start_date + 1) * @workspace.daily_rate * @booking.number_of_persons
    
    if is_there_still_place?
      if @booking.save
        redirect_to bookings_path
      else
        render 'new'
      end
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @booking.update(booking_params)
      redirect_to @booking
    else
      render 'edit'
    end
  end

  def destroy
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price, :number_of_persons)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end

  def is_there_still_place?
    # Create an array of "dates" for each day booked
    date_array = (params[:booking][:start_date]..params[:booking][:end_date]).to_a
    # In this Array, we need to verify for each element = day, that the capacity is not exceeded
    date_array.all? do |date|
      # Extract all the bookings corresponding to this day, and to to the workspace
      bookings = Booking.where(
                                "bookings.workspace_id = :workspace_id
                                AND :date >= bookings.start_date
                                AND :date <= bookings.end_date",
                                workspace_id: params[:workspace_id],
                                date: date
                              )
      # Sum all the persons of all the bookings of this day
      sum_bookings = bookings.sum(:number_of_persons)
      # Add the number_of_persons the user wants to book for
      new_sum_bookings = sum_bookings + params[:booking][:number_of_persons].to_i
      # Compares the future number of persons (if the booking is accepted) to the capacity of workspace
      new_sum_bookings <= Workspace.find(params[:workspace_id]).capacity
    end
  end

  def sum
    date_array = (params[:booking][:start_date]..params[:booking][:end_date]).to_a
    # In this Array, we need to verify for each element = day, that the capacity is not exceeded
    date_array.all? do |date|
      # Extract all the bookings corresponding to this day, and to to the workspace
      bookings = Booking.where(
                                "bookings.workspace_id = :workspace_id
                                AND :date >= bookings.start_date
                                AND :date <= bookings.end_date",
                                workspace_id: params[:workspace_id],
                                date: date
                              )
      # Sum all the persons of all the bookings of this day
      sum_bookings = bookings.sum(:number_of_persons)
    end
  end
end
