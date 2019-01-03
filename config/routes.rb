Rails.application.routes.draw do
  
  root 'posts#index'
   
  resources :users 
  resources :posts do
  resources :likes
  resources :comments

  end
  resources :profiles
  resources :password_resets,  only: [:new, :edit, :create, :update]
  get  'edit'                 => 'users#edit'
  get  'my_post'              => 'posts#my_post' 
  get  'login'                => 'sessions#new'
  post 'login'                => 'sessions#login'
  get  'logout'               => 'sessions#logout'
    
end
