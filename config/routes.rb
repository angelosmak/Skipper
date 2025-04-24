Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    get "/users/sign_out" => "devise/sessions#destroy"
  end
  get "/", to: "public#home"
  # Skippers' dashboard and profile management
  get  "/dashboard",        to: "skippers#dashboard", as: "skipper_dashboard"
  get  "/skippers",         to: "skippers#index",     as: "skippers"
  get  "/skippers/:id",     to: "skippers#show",      as: "skipper"

  # Customer login and logout
  get  "/login",            to: "sessions#new",       as: "login"
  post "/login",            to: "sessions#create"
  delete "/logout",         to: "sessions#destroy",   as: "logout"

  resources :skippers do
    get :availability_events, on: :member
  end
end
