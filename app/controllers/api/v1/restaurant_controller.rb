class Api::V1::RestaurantController < ApplicationController
  def index
    if params[:start].empty? || params[:destination].empty? || params[:food].empty?
      render json: { error: 'params must include start, destination, and food' }
    else
      @trip_info = MunchieFacade.get_trip_info(params[:start], params[:destination], params[:food])
      render json: MunchieSerializer.new(@trip_info)
    end
  end
end
