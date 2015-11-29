Rails.application.routes.draw do
  resources :cohorts
  get 'students/:id/payments/new' => 'payments#new', as: :new_student_payment
  get 'students/:id/payments' => 'students#payments', as: :student_payments
  get 'location' => 'students#location', as: :student_location
  get 'checks/new' => redirect('/checks')
  get 'stripes/new' => redirect('/stripes')
  get 'loans/new' => redirect('/loans')
  get 'wires/new' => redirect('/wires')
  get 'webhooks/stripe_webhook' => redirect('/')
  get 'payments' => 'payments#index', as: :payments
  post 'twilio/voice' => 'twilio#voice'
  post 'students/:student_id/:payment_type/:id/notify' => 'notifications#notify', as: :payment_notification
  post 'stripe/deposit' => 'webhooks#stripe_webhook'

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

# get '/stripes' => 'stripes#index', as: :stripes
# post '/stripes' => 'stripes#create'
# get '/stripes/:id' => 'stripes#show', as: :one_stripe
# get '/stripes/new' => 'stripes#new', as: :new_stripe
# get '/stripes/:id/edit' => 'stripes#edit', as: :edit_stripe
# patch '/stripes/:id' => 'stripes#update'
# put '/stripes/:id' => 'stripes#update'
# delete '/stripes/:id' => 'stripes#destroy'

  resources :stripes
  resources :wires
  resources :checks
  resources :loans
  resources :students
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'students#index'

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
