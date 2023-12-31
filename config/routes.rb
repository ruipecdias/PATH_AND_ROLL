Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  resources :incidents, except: [:destroy] do
    resources :comments, only: [:index, :create], shallow: true
    resources :affecting_pins, only: [:create]
  end

  delete "incidents/:id", to: "incidents#destroy", as: "destroy_incident"

  get '/dashboard', to: 'pages#dashboard', as: 'dashboard'

  patch "toggle_pin/:id", to: "affecting_pins#toggle_pin", as: "toggle_pin"

end
