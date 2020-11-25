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

    if @booking.save
      redirect_to bookings_path
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
    redirect_to workspaces_path
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :total_price)
  end

  def find_booking
    @booking = Booking.find(params[:id])
  end
end
