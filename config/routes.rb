Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'routines#index'
  
 resources :overviews, only: [:index] do
    get :search, on: :collection
  end
 
  resources :profiles, only: [:show, :edit, :update]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :routines do
    resources :videos, only: [:new, :create, :edit, :update, :destroy]
  end
  
  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  
  resources :pickups, only: [:create, :destroy]
end
