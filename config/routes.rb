Rails.application.routes.draw do
  root "api/v1/alerts#index"

  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :alerts
    end
  end

  post "/sign_in", to: "api/v1/sessions#create"
  post "/sign_up", to: "api/v1/registrations#create"
end
