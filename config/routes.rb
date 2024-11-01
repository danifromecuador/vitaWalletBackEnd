Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  get "/" => "v1/users#index"
  namespace :v1 do
    resources :users do
      resources :transactions
    end
  end
  get "v1/btc_usd_exchange_rate" => "v1/rates#rate"
end
