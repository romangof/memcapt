Rails.application.routes.draw do

 post 'users/login' => 'users#login'
 get 'images/sources' => 'images#sources'

 resources :users, only: [:index, :show, :create, :update, :destroy] do
   resources :images, only: [:index, :show, :create, :update, :destroy]
 end

 resources :categories, only: [:index, :show, :create, :update, :destroy] do
   resources :images, only: [:index, :show, :update, :destroy]
 end

 resources :images, only: [:index, :show, :create, :update, :destroy]

 # Routing error
 match "*path", to: "application#render_404", via: :all
end