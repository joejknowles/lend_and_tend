Rails.application.routes.draw do

  root 'static#index'

  devise_for :users, :controllers => { omniauth_callbacks: 'users/omniauth_callbacks'}

  get '/about_us' => 'static#about_us'
  get '/faq' => 'static#faq'
  get '/terms' => 'static#terms'

  get '/users/edit_profile' => 'users#edit_profile'
  put '/users/edit_profile' => 'users#update_profile'
  put '/users/update_avatar' => 'users#update_avatar'

  resources :homepage_images
  resources :patches

  resources :users, only: [ :show ] do
    resources :user_emails, only: [:new, :create]
  end

  resources :user_avatars, only: [:destroy]


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
