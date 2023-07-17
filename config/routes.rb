Rails.application.routes.draw do
  root "pages#home"
  resources :users, only: [:new, :create]
  get "/verify_your_email/", to: "users#verify_your_email"
end
