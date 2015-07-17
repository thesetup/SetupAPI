Rails.application.routes.draw do
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

  post 'users/register', to: 'users#register'
  get 'users/:user_id', to: 'users#show'
  get 'users', to: 'users#index'
  post 'users/login', to: 'users#login'
  delete 'users/:user_id', to: 'users#delete'
  get 'users/:user_id/profiles', to: 'users#profiles'

  post '/profiles/:profile_id/videos', to: 'profiles#create_video'

  get '/profiles/:profile_id/videos/:video_id', to: 'profiles#show_video'
  get '/videos', to: 'profiles#index_videos'

  patch '/profiles/:profile_id/videos/:video_id', to: 'profiles#update_video'
  delete '/profiles/:profile_id/videos/:video_id', to: 'profiles#delete_video'

  patch '/user/:user_id/image', to: 'images#update_avatar'

  post '/profiles/:profile_id/images', to: 'images#create_image'
  delete '/profiles/:profile_id/images/:image_id', to: 'images#delete_video'
  get '/profiles/:profile_id/images/:image_id', to: 'images#show_image'
  get '/images', to: 'images#index_videos'
  
  resources :profiles do
  end

  ###I think we'll want to use the nested videos routes / videos controller
  ###to update videos.




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
