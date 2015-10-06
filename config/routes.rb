Rails.application.routes.draw do
  get 'sessions/new'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'welcome#index'

  get '/users', to: 'users#index', as: 'users'
  get '/users/new', to: 'users#new', as: 'new_user'
  post '/users', to: 'users#create'
  get '/users/:id', to: 'users#show', as: 'user'
  get '/users:id/edit', to: 'users#edit', as: 'edit_user'
  patch '/users/:id', to: 'users#update'
  put '/users/:id', to: 'users#update'
  delete '/users/:id', to: 'users#destroy'

  get '/events', to: 'events#index', as: 'events'
  get '/events/new', to: 'events#new', as: 'new_event'
  post '/events', to: 'events#create'
  get '/events/:id', to: 'events#show', as: 'event'
  get '/events:id/edit', to: 'events#edit', as: 'edit_event'
  patch '/events/:id', to: 'events#update'
  put '/events/:id', to: 'events#update'
  delete '/events/:id', to: 'events#destroy'

  get '/connections', to: 'connections#index', as: 'connections'
  get '/connections/new', to: 'connections#new', as: 'new_connection'
  post '/connections', to: 'connections#create'
  get '/connections/:id', to: 'connections#show', as: 'connection'
  get '/connections:id/edit', to: 'connections#edit', as: 'edit_connection'
  patch '/connections/:id', to: 'connections#update'
  put '/connections/:id', to: 'connections#update'
  delete '/connections/:id', to: 'connections#destroy'

  get '/attendances', to: 'attendances#index', as: 'attendances'
  get '/attendances/new', to: 'attendances#new', as: 'new_attendance'
  post '/attendances', to: 'attendances#create'
  get '/attendances/:id', to: 'attendances#show', as: 'attendance'
  get '/attendances:id/edit', to: 'attendances#edit', as: 'edit_attendance'
  patch '/attendances/:id', to: 'attendances#update'
  put '/attendances/:id', to: 'attendances#update'
  delete '/attendances/:id', to: 'attendances#destroy'

  get '/sessions/new', to:'sessions#new', as: 'login'
  post '/sessions/create', to: 'sessions#create', as: 'signup_path'
  delete 'log_out' => 'sessions#destroy'


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
