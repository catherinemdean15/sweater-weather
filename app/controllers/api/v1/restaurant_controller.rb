class Api::V1::RestaurantController < ApplicationController
  def index
    @trip_info = MunchieFacade.get_trip_info(params[:start], params[:destination], params[:food])
    render json: MunchieSerializer.new(@trip_info)
  end
end
