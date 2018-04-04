class FlightsController < ApplicationController
  def index
    @origin = Airport.all.map{ |i| [i.code.to_s, i.id.to_s] }
    @destination = Airport.all.map{ |i| [i.code.to_s, i.id.to_s] }
    @dates = Flight.all.map{ |i| [i.depart_time.strftime("%Y/%m/%d"), i.depart_time.strftime("%d/%m/%Y")] }
    if params['commit']
      @flights = Flight.where("origin = :origin_id and destination =
                                :destination_id and DATE(depart_time) = :date",
                                origin_id: params['origin_id'],
                                destination_id: params['destination_id'],
                                date: params['depart_date'].to_date)
    else
      @flights = Flight.all
    end
  end
end
