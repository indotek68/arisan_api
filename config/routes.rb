Rails.application.routes.draw do
  get 'user_rooms/index'

  root 'rooms#index'
  get 'rooms/:room_id/users', to: 'rooms#info'
  post 'rooms/:room_id/users/:user_id', to: 'rooms#join'
  post 'user/:user_id/rooms', to: 'rooms#create'
  post '/login', to: 'session#create'
  get '/logged_in_user', to: 'session#logged_in_user'

  resources :rooms 
  resources :users
  resources :sessions
end
