Rails.application.routes.draw do
  get 'user_rooms/index'

  root 'rooms#index'
  get 'rooms/:room_id/users', to: 'rooms#info'
  post 'rooms/:room_id/users/:user_id', to: 'rooms#join'

  resources :rooms
  resources :users
end
