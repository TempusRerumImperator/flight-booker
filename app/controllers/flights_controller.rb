class FlightsController < ApplicationController
  def index
    @origin = Airport.all.map{ |i| [i.code.to_s, i.id.to_s] }
    @destination = @origin
    @dates = create_dates
    @flights = (params['commit'].exist? ? find_flights(params) : Flight.all)
  end

  private

  # Finds all flights for given origin, date and destination
  def find_flights(params)
    Flight.where("origin = :origin_id and destination =
                             :destination_id and DATE(depart_time) = :date",
                             origin_id: params['origin_id'],
                             destination_id: params['destination_id'],
                             date: params['depart_date'].to_date)
  end

  # Creates a list of properly formatted date strings
  def create_dates
    Flight.all.map{ |i| [i.depart_time.strftime("%Y/%m/%d"), i.depart_time.strftime("%d/%m/%Y")] }
  end
end
