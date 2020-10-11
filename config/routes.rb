Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'routines#index'
  
 resources :overviews, only: [:index] do
    get :search, on: :collection
  end
  
  get 'pool', to: 'pools#index'
  get 'my_pool', to: 'pools#mine'
  get 'all_pool', to: 'pools#all'
  get 'search_video', to: 'pools#search'
 
  resources :profiles, only: [:show, :edit, :update]
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  
  resources :routines do
    put 'videos', controller: 'videos', action: :adding
    patch 'videos', controller: 'videos', action: :adding
    get 'videos/new', controller: 'videos', action: :new
    get 'videos/:id/edit', controller: 'videos', action: :edit
    post 'videos', controller: 'videos', action: :create
    patch 'videos/:id', controller: 'videos', action: :update
    delete 'videos/:id', controller: 'videos', action: :destroy
  end
  
  resources :users, only: [:index, :show, :new, :create, :edit, :update]
  
  resources :pickups, only: [:create, :destroy]
  
  resources :takeins, only: [:create, :destroy]

end
