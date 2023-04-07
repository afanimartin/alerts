require "rails_helper"

FactoryBot.define do
  email { "dev@alerts.com" }
  password { "123456" }
end

FactoryBot.define do
  alert_type {  }
  tag {  }
  description {  }
  origin {  }
end

RSpec.describe "Alerts", type: :request do
  describe "POST /create" do
    let(:user) { FactoryBot.create(:user) }

    before do
      # login the user using devise
      sign_in user
    end

    it "creates alerts for valid user" do
      # get the user's access_token
      access_token = user.access_token

      # set the authorization header to the user's access_token
      request.headers["Authorization"] = "Token token=\"#{access_token}\""

      # create an alert using factory_bot
      alert
    end
  end
end
