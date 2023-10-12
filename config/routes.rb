Rails.application.routes.draw do

  get 'admin/index', to: 'admin#index'
  controller 'session' do
    get 'login', to: 'session#new'
    post 'login', to: 'session#create'
    delete 'logout', to: 'session#destroy'
  end
  resources :users
  root to: 'store#index', as: 'store_index'
  resources :orders
  resources :line_items
  resources :carts
  resources :products do
    get :who_bought, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
