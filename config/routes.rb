Rails.application.routes.draw do

  get 'errors/not_found'

  get 'errors/internal_server_error'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  get '/' => 'pages#home'

  get '/celulares'      => 'phones#index', as: :phones
  get '/celulares/:id'  => 'phones#show', as: :phone
  get '/comparador'  => 'phones#compare'
  get '/comparador/:phone_id' => 'phones#compare'
  get '/spec_comp' => 'phones#spec_comp'
  get '/plan_info' => 'phones#plan_info'
  get '/contracts_plans' => 'phones#contracts_plans'

  get '/accesorios/'    => 'accessories#index', as: :accessories
  get '/accesorios/:id' => 'accessories#show', as: :accessory

  get '/contratos/'     => 'contracts#index', as: :contracts
  get '/contratos/:id/plan/:plan_id'  => 'contracts#show'

  get '/ofertas'       => 'offers#index', as: :offers
  get '/ofertas/:id' => 'offers#show', as: :offer

  get '/contacto'      => 'pages#contact'

  get '/nextorprevplan' => 'contracts#next_or_prev_plan'

  post 'send_contact_info'  => 'pages#send_contact_info',                 as: :send_contact_info

  match "/404", :to => "errors#not_found", :via => :all
  match "/500", :to => "errors#internal_server_error", :via => :all


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
