class Api::V1::SessionsController < ApplicationController
  def create
    user = User.find_by_email(params[:email])
    if user&.valid_password?(params[:password])
      sign_in user, store: false
      render json: { message: "Logged in successfully.", access_token: current_user.access_token }, status: :ok
    else
      render json: { error: "Invalid email or password." }, status: :unauthorized
    end
  end
end