Inspired::Application.routes.draw do
  get "static_pages/step1"
  match 'step1', to: 'static_pages#step1', via: 'get'
  get "static_pages/step2"
  match 'step2', to: 'static_pages#step2', via: 'get'
  get "static_pages/step3"
  match 'step3', to: 'static_pages#step3', via: 'get'
  match 'about', to: 'static_pages#about', via: 'get'
  resources :events

  mount Ckeditor::Engine => '/ckeditor'
  resources :posts

  match 'home', to: 'home#index', via: 'get'
  resources :universities

  devise_for :users, :controllers => { :registrations => "registrations" }

  match 'interesting', to: 'posts#interesting', via: 'get'  
 
  match 'users', to: 'users#index', via: 'get'
  
  root 'homes#index'

  resources :post do
      resources :comments
  end

   resources :event do
      resources :comments
  end

  match 'search', to: 'posts#search', via: 'get'

  #match 'home', to: 'homes#index', as: 'user_root'
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
