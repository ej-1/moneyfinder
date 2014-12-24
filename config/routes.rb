Ratesfinder::Application.routes.draw do
  get 'loans/new'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :rates

  # Erik. jag tror denna rad hämtar view-filen world i mappen hello. app/views/hello/world

  
  # We'll add this line to tell Rails about the new action.

  # This line was added when the controller was generated
  get 'hello/world'
  # Ändra på första 'om' för att ändra webadressen
  get "om" => 'hello#om'
  get "kontakt" => 'hello#kontakt'
  get "sparrantor" => 'rates#index'
  get "sparguide" => 'rates#sparguide'
  get "landets_rantor" => 'rates#landets_rantor'
  get "lanerantor" => 'loans#lanerantor'
  get "lankalkylator" => 'loans#lankalkylator'
  get "calculate" => 'calculates#calculate'
# `match 'calculate' => 'your_controller_name#calculate' in config/routes.rb.

  # Den här raden hämtar view-filen 'home' i mappen hello. app/views/hello/home
  root :to => 'rates#index'
end


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
