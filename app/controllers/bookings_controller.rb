class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @flight = Flight.find(params['flight_id'])
    @passengers = Array.new(params['passenger_count'].to_i) do
      @booking.passengers.build
    end
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
    @passengers.each { |passenger| puts passenger.name }
  end

  private

    def booking_passengers(passengers)
      passengers.map { |passenger| Passenger.create(passenger_params(passenger)) }
    end

    def passenger_params(passenger)
      passenger.permit(:name, :surname, :email)
    end
end
