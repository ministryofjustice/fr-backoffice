Rails.application.routes.draw do

  # get 'claim/index'

  # get 'claim/new'

  # get 'claim/create'

  # get 'claim/update'

  # get 'claim/destroy'

  # get 'claim/show'

  # get 'claim/edit'

  resources :claims do
    member do
      get 'completion'
    end
  end

  scope FrBackoffice::Application.config.relative_url_root || '/' do
    root 'welcome#index'
    get 'welcome/index'

    get  '/help',           controller: :static, action: :help, as: :help
    get  '/maintenance',    controller: :static, action: :maintenance, as: :maintenance
    get  '/cookies',        controller: :static, action: :cookies, as: :cookies
    get  '/accessibility',  controller: :static, action: :accessibility, as: :accessibility
    get  '/terms',          controller: :static, action: :terms, as: :terms
    get  '/expired',        controller: :static, action: :expired, as: :expired


    get '/remission/thresholds',    controller: :remission_calculator, action: :thresholds
    get '/fee/contribution',        controller: :remission_calculator, action: :contribution



    # The priority is based upon order of creation: first created -> highest priority.
    # See how all your routes lay out with "rake routes".

    # You can have the root of your site routed with "root"

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
end