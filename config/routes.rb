Rails.application.routes.draw do
  devise_for :users
  get 'page/index'
  root 'page#index'

  resources :chat_rooms, only: [:index, :show, :new, :create]
  mount ActionCable.server => '/cable'
end
