Rails.application.routes.draw do
  resources :anotifications do 
    member do
      get 'mark_read'
    end
  end
  get 'read_by/:id/users', to: "anotifications#read_by", as: 'read_by'
  get 'nachrichtens/index'
  get 'conversations/index'
  devise_for :users, path_names: {registration: 'registration'}
  resources :users do
    match '/savenew', to: 'users#savenew', via: :post
  end
  resources :accounts
  resources :messages do
    get '/all' => 'messages#show_archive'
  end

  root 'home#index'

  post '/add_to_channel' => 'users#add_to_channel', as: 'add_to_channel'
  post '/make-notification' => 'users#make_notification'
  delete '/remove_user/:id' => 'channels#remove_user', as: 'remove_user'
  resources :channels do
    resources :messages
    member do
      get 'add_new_user'
    end
  end

  resources :conversations, only: [:index, :create] do
    resources :nachrichtens, only: [:index, :create]
  end

  mount ActionCable.server, at: '/cable'
end
