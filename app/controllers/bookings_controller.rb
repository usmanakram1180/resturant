class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    respond_to do |format|
      if @booking.save
        format.html { redirect_to booking_path, notice: 'Your Booking created Successfully' }
        format.json { render json: { message: "Thank you for your message. We will get back to you soon." }, status: :created }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end
  
  private

  def booking_params
    params.permit(:name, :email, :datetime, :people, :message)
  end
end
