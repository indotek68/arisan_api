Rails.application.routes.draw do
  get 'user_rooms/index'

  root 'rooms#index'
  get 'rooms/:room_id/users', to: 'rooms#info'
  post 'rooms/:room_id/users/:user_id', to: 'rooms#join'
  post 'user/:user_id/rooms', to: 'rooms#create'

  resources :rooms 
  resources :users
end
