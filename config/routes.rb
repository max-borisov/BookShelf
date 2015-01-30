Rails.application.routes.draw do
  # get 'cart_items/index'
  # get 'cart_items/destroy'

  root to: "books#index"
  get   'signup'  => 'users#new'
  get   'signin'  => 'sessions#new'
  get   'profile' => 'users#profile'

  post  'signin'  => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  resources :books do
    post 'review', on: :member
  end
  # post 'book/review' => 'books#review', as: 'book_review'

  resources :users
  # resources :carts
  resources :cart_items
  resources :orders, only: [:index, :create]
  # resources :passwords, only: [:edit, :update]

  get     'password-update' => 'passwords#edit', as: 'password_edit'
  patch   'password-update' => 'passwords#update'

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
