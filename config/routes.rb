Rails.application.routes.draw do
  get 'apps/new'
  get 'apps/create'
  get 'apps/update'
  get 'apps/edit'
  get 'apps/destroy'
  get 'apps/show'
  get 'apps/index'
  root :to => 'home#index'
  get '/products', :to => 'products#index'
  mount ShopifyApp::Engine, at: '/'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
