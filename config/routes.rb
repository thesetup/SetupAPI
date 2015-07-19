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

  post 'users/register',                                    to: 'users#register'
  get 'users/:user_id',                                     to: 'users#show'
  get 'users',                                              to: 'users#index'
  post 'users/login',                                       to: 'users#login'
  delete 'users/:user_id',                                  to: 'users#delete'
  get 'users/:user_id/profiles',                            to: 'users#profiles'                  ## See all profiles belonging to a user.
  put 'users/:user_id/avatar',                              to: 'users#update_self_avatar'        ## Update your own avatar.

  post 'profiles/:profile_id/videos',                       to: 'videos#create_video'
  get 'profiles/:profile_id/videos/:video_id',              to: 'videos#show_video'
  get 'videos',                                             to: 'videos#index_videos'
  patch 'profiles/:profile_id/:video_id',                   to: 'videos#update_video'
  delete '/profiles/:profile_id/videos/:video_id',          to: 'videos#delete_video'

  get 'profiles',                                           to: 'profiles#index'
  get 'profiles/:profile_id',                               to: 'profiles#show'
  delete 'profiles/:profile_id',                            to: 'profiles#destroy'
  post 'profiles',                                          to: 'profiles#create'
  put 'profiles/:profile_id/avatar',                        to: 'profiles#update_profilee_avatar' ## Update a profilee's avatar.

  post 'profiles/:profile_id/images',                      to: 'images#create_image'
  get 'profiles/:profile_id/images/:image_id',             to: 'images#show_image'
  get 'images',                                            to: 'images#index_image'
  patch 'profiles/:profile_id/images/:image_id',           to: 'images#update_image'




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
