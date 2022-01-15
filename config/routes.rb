Rails.application.routes.draw do
  devise_for :users, 
            controllers: { sessions: 'users/sessions', registrations: 'users/registrations',
            passwords: 'users/passwords'}

  devise_scope :user do
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'welcome#index', as: :unauthenticated_root
    end
  end

  resources :groups, only: [:index, :show, :create, :new], path: '/categories'
  resources :user_transactions, only: [:new, :create], path: '/transactions'

  post '/navbar/welcome', to: 'welcome#navbar'
  post '/navbar/logged', to: 'users#navbar'
  root to: 'welcome#index'
end
