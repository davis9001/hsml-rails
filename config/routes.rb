Rails.application.routes.draw do
  resources :ebd_movie_maps
  resources :ebds
  resources :movies

  get '/movies/show-from-search/by', to: 'movies#show_from_title'
  get '/movies/show-from-imdb-id/:imdb_id' => 'movies#show_from_imdb_id'
  get '/movies/create-from-imdb-id/:imdb_id' => 'movies#create_from_imdb_id'
  get '/movies/:id/add-ebd' => 'movies#add_ebd'
  get '/erb_movie_map/new-from-movie' => 'erb_movie_map#new_from_movie'
  get '/erb_movie_map/new-from-erb' => 'erb_movie_map#new_from_movie'
  get '/erb_movie_map/new/' => 'erb_movie_map#new_from_movie'
  get '/ebd-movie-map/match/' => 'ebd_movie_maps#match'
  get '/ebd-movie-map/unmatch/' => 'ebd_movie_maps#unmatch'
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
