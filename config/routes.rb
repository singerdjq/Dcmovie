Rails.application.routes.draw do
  
  get 'password_resets/new'
  get 'password_resets/edit'
  resources :pictures
  resources :feeds
  get 'admin/index'
 # get 'sessions/new'
  #get 'sessions/create'
  #get 'sessions/destroy'
   controller :sessions do
       get 'login'=> :new
       post 'login'=> :create
       delete 'logout'=> :destroy
   end
 get  '/chart',    to: 'store#chart'
  get  '/news',   to: 'pictures#index'
  get  '/contact', to: 'store#contact'
    
  resources :users
  resources :orders
  resources :line_items
  resources :carts
resources :microposts,          only: [:create, :destroy]
    resources :password_resets,     only: [:new, :create, :edit, :update]

  #resources :movies
 #root 'movies#index'
root 'store#index', as: 'store_index'
    resources :movies do
        get :who_bought, on: :member
    end
    resources :feeds do
  member do
   resources :entries, only: [:index, :show]
  end
end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
