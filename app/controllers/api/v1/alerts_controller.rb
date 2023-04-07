class Api::V1::AlertsController < ApplicationController
  def index
    @alerts = Alert.all
    respond_to do |format|
      format.html
      format.json { render json: @alerts, status: :ok }
    end
  end

  def create
    authenticate_or_request_with_http_token do |token, options|
      user = User.find_by(access_token: token)
      if user && Devise.secure_compare(user.access_token, token)
        sign_in user, store: false
        alert = Alert.new(alert_params)
        if alert.save
          render json: { message: "Alert created successfully." }, status: :created
        else
          render json: { errors: alert.errors.full_messages }, status: :unprocessable_entity
        end
      else
        render json: { error: "Access token is invalid or missing" }, status: :unauthorized
      end
    end
  end

  private
    def alert_params
      params.require(:alert).permit(:alert_type, :description, tag: []).merge(user_id: current_user.id, origin: request.remote_ip)
    end
end
