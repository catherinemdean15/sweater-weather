class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email].downcase)
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      render json: UserSerializer.new(user), status: 200
    else
      (render json: {error: 'incorrect credentials'}, status: 401)
    end
  end
end
