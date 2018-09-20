Rails.application.routes.draw do
  mount ActionCable.server, at: '/cable'

  get '/', to: 'application#index', as: 'home'

  namespace :api do
    namespace :v1 do
      resources :users, only: [:index, :update, :destroy]
      get 'user', to: 'users#show', as: 'user_show'
      post 'signup', to: 'users#create', as: 'user_signup'
      post 'login', to: 'users#login', as: 'user_login'

      resources :chats
    end
  end
end
