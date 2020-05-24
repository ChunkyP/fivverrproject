Rails.application.routes.draw do
  devise_for :users, path_names: { registration: 'registration' }
  resources :users do
    match '/savenew', to: 'users#savenew', via: :post
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

  mount ActionCable.server, at: '/cable'
end
