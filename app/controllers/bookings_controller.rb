class BookingsController < ApplicationController

  def new
    @booking = Booking.new
    @flight = Flight.find(params['flight_id'])
    @passengers = Array.new(params['passenger_count'].to_i) { Passenger.new }
  end

  def create
    flight = Flight.find(params['flight_id'].to_i)
    passengers = booking_passengers(params['passengers'])
    @booking = Booking.create(flight: flight, passengers: passengers)
    redirect_to @booking
  end

  def show
    @booking = Booking.find(params['id'])
    @flight = @booking.flight
    @passengers = @booking.passengers
  end

  private

  def booking_passengers(passengers)
    passengers.map { |passenger| Passenger.create(passenger_params(passenger)) }
  end

  def passenger_params(passenger)
    passenger.permit(:name, :surname, :email)
    puts ("This thing here")
  end
end
