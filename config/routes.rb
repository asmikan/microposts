Rails.application.routes.draw do
  
  root to: 'static_pages#home'
  get   'signup' , to: 'users#new'
  get   'login'  , to: 'sessions#new'
  post  'login'  , to: 'sessions#create'
  delete'logout'  , to: 'sessions#destroy'
  put   'edit'   , to: 'users#edit'
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :microposts

end
