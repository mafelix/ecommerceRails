  Rails.application.routes.draw do
  devise_for :users
  # ,  :path => "admin"
  resources :carts, only: :show

  resources :cart_items, only: [:create, :update, :destroy]

  resources :reviews
  root 'page#index'

  namespace :admin do
    resources :users
    resources :products
    resources :orders
  end



  resources :cart, only: [:show]
  resources :users, only: [:index, :new, :create, :show]
  resources :page, only: [:index, :post]


  resources :products, only: [:index, :show] do
    resources :reviews, only: [:new, :create]
  end
  resources :sessions, only: [:new, :create]


  # get 'sessions/new'

  # get 'sessions/create'

  # get 'cart/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'
  # post 'page/index' do
  #   @frontpageproduct = Products.last(4);
  #   redirect 'page/index'
  # end

  # get 'products/index' do
  #   redirect 'products/index'
  # end


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
