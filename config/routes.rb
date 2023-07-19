Rails.application.routes.draw do
  root 'pages#home'
  resources :users, only: [:new, :create]
  get '/signup_response/', to: 'users#signup_response'
  get '/email_validation/', to: 'users#email_validation'
end
