Rails.application.routes.draw do
  
  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: [:new]
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
   
  # Login route will not be a resources restful route because it wont hit the database
  #we have to manually create the route


  
  # we don'y need to fo this now because all of the routes are exposed now
  # only: [:show, :index, :new, :create, :edit, :update]

end
