Rails.application.routes.draw do
  devise_for :users
  devise_scope :user do
    authenticated :user do
      root 'home#index', as: :authenticated_root
    end
  
    unauthenticated do
      root 'welcome#index', as: :unauthenticated_root
    end
  end

  root to: 'welcome#index'
end
