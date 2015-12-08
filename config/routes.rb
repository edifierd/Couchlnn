Rails.application.routes.draw do

  get 'couch_calification/new'

  get 'notificaciones/index'

  devise_for :users, :controllers => { registrations: 'registrations' }

  get 'acerca_de/index'
  post 'user_calification/new'
  post 'couch_calification/new'
  get 'couchs/index'
  post 'couchs/index'
  get 'couch_type/index'
  get 'user/index'
  get 'ser_premium/index'
  post 'ser_premium/new'
  get 'password_reset/index'
  post 'password_reset/new'
  get 'reservation/new'
  get 'reservation/index'
  post 'reservation/show'
  get 'comentario/new'
  get 'comentario/edit'
  post 'reservation/buscar'
  resources :couchs
  resources :couch_type
  resources :users
  resources :reservation
  resources :comentario
  resources :user_calification
  resources :couch_calification
  root 'home#index'

  



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
