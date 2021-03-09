class Api::V1::BackgroundsController < ApplicationController
  def index
    @background= UnsplashFacade.get_background(params[:location])
    render json: BackgroundSerializer.new(@background)
  end
end
