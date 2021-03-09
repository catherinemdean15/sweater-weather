class Api::V1::UsersController < ApplicationController
  def create
    user = User.new(user_params)
    if matching_password? && user.save
      user.update({api_key: ApiKey.generator})
      render json: UserSerializer.new(user), status: 201
    else
      (render json: {error: 'passwords do not match'}, status: 401 unless matching_password?) ||
      (render json: {error: 'an unused email must be provided to register'}, status: 400)
    end
  end


  private

  def user_params
    params[:email].downcase!
    params.permit(:email, :password)
  end

  def matching_password?
    params[:password] == params[:password_confirmation]
  end
end
