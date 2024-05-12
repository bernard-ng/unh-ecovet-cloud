Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get '/register', to: "registrations#new"
  post '/register', to: "registrations#create"

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  match '/logout', to: 'sessions#destroy', via: [:delete, :post]

  resource :password_reset
  resource :password

  # Defines the root path route ("/")
  root "main#index"
end
