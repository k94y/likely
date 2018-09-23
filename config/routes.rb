Rails.application.routes.draw do
  namespace :user do
    get 'contacts/new'
    get 'contacts/create'
  end
  namespace :user do
    get 'carts/index'
    get 'carts/create'
    get 'carts/update'
    get 'carts/destroy'
  end
  namespace :user do
    get 'orders/index'
    get 'orders/new'
    get 'orders/create'
    get 'orders/update'
  end
  namespace :user do
    get 'songs/show'
  end
  namespace :user do
    get 'searches/index'
  end
  namespace :user do
    get 'genres/index'
    get 'genres/show'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :user do
    get 'users/index'
  end
end
