Rails.application.routes.draw do

  resources :transaccions
  devise_for :users
  scope "/admin" do
    resources :users
  end

  resources :users
  root 'pages#home'

  get 'users' => 'pages#users'
  match 'users/new' => 'users#new', :as =>'users_new', via: 'get'
  match 'users/create' => 'users#create', :as =>'users_create', via: 'post'

  match 'users/show/:id' => 'users#show', :as =>'users_show', via: 'get'
  match 'users/edit/:id' => 'users#edit', :as =>'users_edit', via: 'get'


  resources :transaccions
  match 'transaccions/detalle/:id' => 'transaccions#detalle', :as =>'transaccions_detalle', via: 'get'
  match 'transaccions/payload/:id' => 'transaccions#payload', :as =>'transaccions_payload', via: 'get'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
