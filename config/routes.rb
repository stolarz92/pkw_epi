Rails.application.routes.draw do
  get 'about/index'

  get 'about' => 'about#index'

  get 'index/index'

  get 'committees/new'

  get 'committees/create'

  get 'committees/index'

  get 'committees/show'

  get 'committees/edit'

  get 'committees/update'

  get 'committees/destroy'

  get 'constituencies/new'

  get 'constituencies/create'

  get 'constituencies/index'

  get 'constituencies/show'

  get 'constituencies/edit'

  get 'constituencies/update'

  get 'constituencies/destroy'

  get 'voivodeships/new'

  get 'voivodeships/create'

  get 'voivodeships/index'

  get 'voivodeships/show'

  get 'voivodeships/edit'

  get 'voivodeships/update'

  get 'voivodeships/destroy'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'index#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products
      resources :voivodeships
      resources :constituencies
      resources :committees

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
