Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'routines#index'
  
  get 'timeline', to: 'timeline#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :routines do
    resources :videos, only: [:new, :create, :edit, :delete]
  end
  resources :users, only: [:index, :show, :new, :create, :edit]
end
