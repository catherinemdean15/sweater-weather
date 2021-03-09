class Api::V1::BackgroundsController < ApplicationController
  def index
    if params[:location].empty?
      render json: {error: 'location must be included'}
    else
    @background= UnsplashFacade.get_background(params[:location])
    render json: BackgroundSerializer.new(@background)
    end
  end
end
