Rails.application.routes.draw do
  devise_for :users, :controllers => {registrations: 'users/registrations'}

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :admin do
    get '/', to: "tops#index"
    resources :products, only: [:index, :new, :create, :edit, :update, :destroy]
    resources :artists, only: [:index, :show, :create, :edit, :update, :destroy]
    resources :genres, only: [:index, :show, :create, :edit, :update, :destroy]
    resources :labels, only: [:index, :show, :create, :edit, :update, :destroy]
    resources :users, only: [:index, :show,  :edit, :update, :destroy]
    resources :orders, only: [:index, :show, :update, :destroy]
    resources :contacts, only: [:index, :show, :update]
  end

  scope module: :user do
    root to: "genres#index"
    resources :genres, only: [:show]
    resources :searches, only: [:index, :create]
    resources :songs, only: [:show]
    resources :orders, only: [:index, :new, :create, :update]
    resource :mypages, only: [:show, :edit, :new, :create, :update, :destroy]
    resources :carts, only: [:index, :update, :destroy]
    resource :contacts, only: [:new, :create]
    post 'products/:post_id/add', to: "products#add", as: "add_cartdetail"
    patch 'mypages/info', to: 'mypages#create_info'
  end
end
