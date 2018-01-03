Rails.application.routes.draw do
  devise_for :users
  get 'page/index'
  root 'page#index'

  resources :chat_rooms, only: [:index, :show, :new, :create] do
  	resources :members, only: [:index, :create]
  end

  resources :members, only: [:destroy] do
  	get :autocomplete_user_email, :on => :collection
  end
  
  mount ActionCable.server => '/cable'
end
