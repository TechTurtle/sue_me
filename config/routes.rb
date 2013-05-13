SueMe::Application.routes.draw do
  #get "votes/new"

  #get "comments/new"

  #get "lawsuits/new"

  resources :users, only: [:create, :show]
  resources :sessions, only: [:create, :destroy]
  resources :lawsuits, only: [:create, :index, :show, :update, :destroy]
  resources :comments, only: [:create, :index, :show, :update, :destroy]
  resources :votes, only: [:create, :index, :show, :update, :destroy]
  #post '/users' => 'users#create'
 
  match '/signup',  to: 'users#create', via: :post
  match '/user',    to: 'users#show', via: :post
  match '/signin',  to: 'sessions#create', via: :post
  match '/signout', to: 'sessions#destroy', via: :delete

  match '/lawsuits/new',   to: 'lawsuits#create', via: :post
  match '/lawsuits',       to: 'lawsuits#index', via: :get
  match '/lawsuit',        to: 'lawsuits#show', via: :get
  match '/lawsuit/edit',   to: 'lawsuits#update', via: :put
  match '/lawsuit/delete', to: 'lawsuits#destroy', via: :delete

  match '/comments/new',   to: 'comments#create', via: :post
  match '/comments',       to: 'comments#index', via: :get
  match '/comment',        to: 'comments#show', via: :get
  match '/comment/edit',   to: 'comments#create', via: :put
  match '/comment/delete', to: 'comments#destroy', via: :delete

  match '/votes/new',   to: 'comments#create', via: :post
  match '/votes',       to: 'comments#index', via: :get
  match '/vote',        to: 'comments#show', via: :get
  match '/vote/edit',   to: 'comments#create', via: :put
  match '/vote/delete', to: 'comments#destroy', via: :delete

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
