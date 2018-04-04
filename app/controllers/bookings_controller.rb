class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight_id = params['flight_id']
    flight = Flight.find(@flight_id)
    @depart_time = flight.depart_time
    @origin = flight.origin.code
    @destination = flight.destination.code
    @passengers = Array.new(params['passenger_count'].to_i) { Passenger.new }
  end

  def create
    @booking = Booking.new
    @booking.flight = Flight.find(params['flight_id'].to_i)
    @booking.save

    @passengers = params['passengers']
    @passengers.each { |passenger| Passenger.create(passenger_params(passenger)) }
    redirect_to @booking
  end

  def show

  end

  private

    def passenger_params(passenger)
      passenger.permit(:name, :surname, :email)
    end
end
