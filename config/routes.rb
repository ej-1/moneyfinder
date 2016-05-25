Ratesfinder::Application.routes.draw do
  resources :loanbrokers

  resources :gratis_smsloans

  resources :smsloans

  resources :adminsmsloans

  devise_for :admins
  resources :savingrates

  resources :mortgageloans

  get 'loans/new'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :rates

# THE WAY IT WORKS
# get "url" => 'controller and the name of the catalogue#file in the view catalogue'
# get "url" => 'controller and the name of the catalogue#file in the view catalogue and the name of action in controller'

  # Redirects all unknown urls to root url


  # THE NEW THING
  get "sparrantor" => 'adminsavingrates#sparrantor'
  get "bolan" => 'adminmortgageloans#mortgageloans'
  get "smslan" => 'adminsmsloans#smslan'
  get "smslan_nouc" => 'adminsmsloans#smslan_nouc'
  get "smslan3" => 'adminsmsloans#smslan3'
  get "laneformedlare" => 'adminsmsloans#laneformedlare'
  #get "smslan" => 'adminsmsloans#smslanfilter'
  get "transfer" => "layouts#transfer"
  get "gratislan" => 'adminsmsloans#gratislan'

  get "smslan" => 'adminsmsloans#smslan'

  get "smslan_kampanj:smslan,adgroup:anmarkningar" => 'adminsmsloans#smslan_anmarkning'
  get "smslan_kampanj:smslan,adgroup:jamfor" => 'adminsmsloans#smslan'
  get "smslan_kampanj:smslan,adgroup:alder" => 'adminsmsloans#smslan'
  get "smslan_kampanj:smslan,adgroup:belopp" => 'adminsmsloans#smslan'
  get "smslan_kampanj:smslan,adgroup:dagar" => 'adminsmsloans#smslan'
  get "smslan_kampanj:smslan,adgroup:helg" => 'adminsmsloans#smslan'
  get "smslan_kampanj:smslan,adgroup:bankid" => 'adminsmsloans#smslan'
  get "smslan_kampanj:smslan,adgroup:direkt" => 'adminsmsloans#smslan'
  get "smslan_kampanj:smslan,adgroup:kredit" => 'adminsmsloans#smslan'
  get "smslan_kampanj:smslan_kampanj:smslan,adgroup:basta" => 'adminsmsloans#smslan'
  get "smslan_kampanj:smslan,adgroup:billiga" => 'adminsmsloans#smslan'
  get "smslan_kampanj:smslan,adgroup:kronofogden" => 'adminsmsloans#smslan'
  get "smslan_kampanj:smslan,adgroup:other" => 'adminsmsloans#smslan'
  get "smslan_kampanj:smslan,adgroup:skef" => 'adminsmsloans#smslan'
  get "smslan_kampanj:smslan,adgroup:sok" => 'adminsmsloans#smslan'
  get "smslan_kampanj:smslan,adgroup:uc" => 'adminsmsloans#smslan'
  get "smslan_kampanj:smslan,adgroup:gratis" => 'adminsmsloans#smslan'


  get "smslan_kampanj:snabblan,adgroup:jamfor" => 'adminsmsloans#smslan'
  get "smslan_kampanj:snabblan,adgroup:alder" => 'adminsmsloans#smslan'
  get "smslan_kampanj:snabblan,adgroup:belopp" => 'adminsmsloans#smslan'
  get "smslan_kampanj:snabblan,adgroup:dagar" => 'adminsmsloans#smslan'
  get "smslan_kampanj:snabblan,adgroup:helg" => 'adminsmsloans#smslan'
  get "smslan_kampanj:snabblan,adgroup:bankid" => 'adminsmsloans#smslan'
  get "smslan_kampanj:snabblan,adgroup:direkt" => 'adminsmsloans#smslan'
  get "smslan_kampanj:snabblan,adgroup:kredit" => 'adminsmsloans#smslan'
  get "smslan_kampanj:snabblan,adgroup:anmarkningar" => 'adminsmsloans#smslan_anmarkning'
  get "smslan_kampanj:snabblan,adgroup:basta" => 'adminsmsloans#smslan'
  get "smslan_kampanj:snabblan,adgroup:billiga" => 'adminsmsloans#smslan'
  get "smslan_kampanj:snabblan,adgroup:kronofogden" => 'adminsmsloans#smslan'
  get "smslan_kampanj:snabblan,adgroup:SKEF" => 'adminsmsloans#smslan'
  get "smslan_kampanj:snabblan,adgroup:sok" => 'adminsmsloans#smslan'
  get "smslan_kampanj:snabblan,adgroup:uc" => 'adminsmsloans#smslan'
  get "smslan_kampanj:snabblan,adgroup:gratis" => 'adminsmsloans#smslan'


  get "smslan_kampanj:mikrolan,adgroup:jamfor" => 'adminsmsloans#smslan'
  get "smslan_kampanj:mikrolan,adgroup:alder" => 'adminsmsloans#smslan'
  get "smslan_kampanj:mikrolan,adgroup:belopp" => 'adminsmsloans#smslan'
  get "smslan_kampanj:mikrolan,adgroup:dagar" => 'adminsmsloans#smslan'
  get "smslan_kampanj:mikrolan,adgroup:helg" => 'adminsmsloans#smslan'
  get "smslan_kampanj:mikrolan,adgroup:bankid" => 'adminsmsloans#smslan'
  get "smslan_kampanj:mikrolan,adgroup:direkt" => 'adminsmsloans#smslan'
  get "smslan_kampanj:mikrolan,adgroup:kredit" => 'adminsmsloans#smslan'
  get "smslan_kampanj:mikrolan,adgroup:anmarkningar" => 'adminsmsloans#smslan_anmarkning'
  get "smslan_kampanj:mikrolan,adgroup:basta" => 'adminsmsloans#smslan'
  get "smslan_kampanj:mikrolan,adgroup:billiga" => 'adminsmsloans#smslan'
  get "smslan_kampanj:mikrolan,adgroup:kronofogden" => 'adminsmsloans#smslan'
  get "smslan_kampanj:mikrolan,adgroup:SKEF" => 'adminsmsloans#smslan'
  get "smslan_kampanj:mikrolan,adgroup:sok" => 'adminsmsloans#smslan'
  get "smslan_kampanj:mikrolan,adgroup:uc" => 'adminsmsloans#smslan'
  get "smslan_kampanj:mikrolan,adgroup:gratis" => 'adminsmsloans#smslan'


  get "smslan_kampanj:lan,adgroup:jamfor" => 'adminsmsloans#smslan'
  get "smslan_kampanj:lan,adgroup:alder" => 'adminsmsloans#smslan'
  get "smslan_kampanj:lan,adgroup:belopp" => 'adminsmsloans#smslan'
  get "smslan_kampanj:lan,adgroup:dagar" => 'adminsmsloans#smslan'
  get "smslan_kampanj:lan,adgroup:helg" => 'adminsmsloans#smslan'
  get "smslan_kampanj:lan,adgroup:bankid" => 'adminsmsloans#smslan'
  get "smslan_kampanj:lan,adgroup:direkt" => 'adminsmsloans#smslan'
  get "smslan_kampanj:lan,adgroup:kredit" => 'adminsmsloans#smslan'
  get "smslan_kampanj:lan,adgroup:anmarkningar" => 'adminsmsloans#smslan_anmarkning'
  get "smslan_kampanj:lan,adgroup:basta" => 'adminsmsloans#smslan'
  get "smslan_kampanj:lan,adgroup:billiga" => 'adminsmsloans#smslan'
  get "smslan_kampanj:lan,adgroup:kronofogden" => 'adminsmsloans#smslan'
  get "smslan_kampanj:lan,adgroup:SKEF" => 'adminsmsloans#smslan'
  get "smslan_kampanj:lan,adgroup:sok" => 'adminsmsloans#smslan'
  get "smslan_kampanj:lan,adgroup:uc" => 'adminsmsloans#smslan'
  get "smslan_kampanj:lan,adgroup:generic" => 'adminsmsloans#smslan'













  get "norwegian" => 'adminsmsloans#norwegian'
  get "leasylan" => 'adminsmsloans#leasylan'
  get "leasyminilan" => 'adminsmsloans#leasyminilan'

  get "thorn" => 'adminsmsloans#thorn'
  get "frogtail" => 'adminsmsloans#frogtail'
  get "klicklan" => 'adminsmsloans#klicklan'
  get "onea" => 'adminsmsloans#onea'
  get "monetti" => 'adminsmsloans#monetti'
  get "vivus" => 'adminsmsloans#vivus'
  get "ferratum" => 'adminsmsloans#ferratum'
  get "meddelandelan" => 'adminsmsloans#meddelandelan'
  get "snabbfinans" => 'adminsmsloans#snabbfinans'
  get "natlan" => 'adminsmsloans#natlan'
  get "expresskredit" => 'adminsmsloans#expresskredit'
  get "cash2you" => 'adminsmsloans#cash2you'
  get "kundfinans" => 'adminsmsloans#kundfinans'
  get "savelend" => 'adminsmsloans#savelend'
  get "daypay" => 'adminsmsloans#daypay'
  get "moneygo" => 'adminsmsloans#moneygo'
  get "strandiafinans" => 'adminsmsloans#strandiafinans'
  get "kredit365" => 'adminsmsloans#kredit365'
  get "nanokredit" => 'adminsmsloans#nanokredit'
  get "everydayplus" => 'adminsmsloans#everydayplus'
  get "easycredit" => 'adminsmsloans#easycredit'
  get "nanoflex" => 'adminsmsloans#nanoflex'
  get "kortlan" => 'adminsmsloans#kortlan'
  get "smspengar" => 'adminsmsloans#smspengar'
  get "euroloan" => 'adminsmsloans#euroloan'
  get "extrakredit" => 'adminsmsloans#extrakredit'
  get "pengos" => 'adminsmsloans#pengos'
  get "kreditkontot" => 'adminsmsloans#kreditkontot'
  get "trustbuddy" => 'adminsmsloans#trustbuddy'
  get "cashbuddy" => 'adminsmsloans#cashbuddy'
  get "risicum" => 'adminsmsloans#risicum'  
  get "lanbutiken" => 'adminsmsloans#lanbutiken'  
  get "sakerfinans" => 'adminsmsloans#sakerfinans'  



  get "sparguide" => 'public#sparguide'
  get "landets_rantor" => 'public#landets_rantor'
  get "/om" => 'public#om'
  get "vanliga_fragor" => 'public#vanliga_fragor'

  get "bolanekalkylator" => 'adminmortgageloans#lankalkylator'

  # FOR USER WHO ENTER FROM FACEBOOK
  get "sparrantor_fb" => 'adminsavingrates#sparrantor_fb'
  get "om_fb" => 'public#om_fb'
  get "sparguide_fb" => 'public#sparguide_fb'
  get "redirect_akeliusspar" => 'public#redirect_akeliusspar'

  # THE MAIN LANDING PAGE - CODE NEEDS TO BE AFTER ALL OTHER ROUTES
  root :to => 'adminsmsloans#smslan'
  match '*path' => redirect('/'), via: :get
end

#  root :to => 'public#mainlanding'
# end

# OLD ROUTES
# get "mortgageloans2" => 'mortgageloans#mortgageloans2'
# get "smslan2" => 'smsloans#smslan2'
# get "smsloans" => 'smsloans#smsloans'



  # ------------------------------------------------------------------------------------

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
