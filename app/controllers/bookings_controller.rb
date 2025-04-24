class BookingsController < ApplicationController
  before_action :set_skipper

  def create
    @booking = @skipper.bookings.new(booking_params)
    if @booking.save
      redirect_to skipper_path(@skipper), notice: "Booking created successfully!"
    else
      render "skippers/show", alert: "Unable to create booking."
    end
  end

  private

  def set_skipper
    @skipper = Skipper.find(params[:skipper_id])
  end

  def booking_params
    params.require(:booking).permit(:date)
  end
end
