Combat::Application.routes.draw do
  resources :authentications
  resources :blogs
  resources :messages
  resources :schools do
    collection { post :import }
  end
  
 
  devise_for :users, controllers: {omniauth_callbacks: "authentications", registrations: "registrations"}

  root to: 'home#index'
  match '/terms_of_service' => 'home#terms_of_service'
  match '/home' => 'home#index'
  match '/about' => 'home#about'
  match 'about/veterans' => 'home#veterans'
  match 'about/educators' => 'home#educators'
  match 'about/employers' => 'home#employers'
  match 'about/supporters' => 'home#supporters'
  match '/privacy_policy' => 'home#privacy_policy'
  match '/faq' => 'home#faq'
  match '/public_search' => 'home#public_search'
  match 'school/compare' => 'schools#compare', :as => "compare"
  match 'update_session' => 'schools#update_session'
  match 'remove_school' => 'schools#remove_school'
  
  
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
