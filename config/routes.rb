Rails.application.routes.draw do
  root :to => 'site#login'
  get 'site/about', to: 'site#about'

  resources :users do
    resources :clients, shallow: true do
      resources :medicines, shallow: true
    end
  end


# for twilio
  # post 'twilio/voice', to: 'twilio#voice'
  # post 'notifications/notify', to: 'notifications#notify'

#              Prefix Verb   URI Pattern                                 Controller#Action
#                root GET    /                                           site#login
#          site_about GET    /site/about(.:format)                       site#about
#    client_medicines GET    /clients/:client_id/medicines(.:format)     medicines#index
#                     POST   /clients/:client_id/medicines(.:format)     medicines#create
# new_client_medicine GET    /clients/:client_id/medicines/new(.:format) medicines#new
#       edit_medicine GET    /medicines/:id/edit(.:format)               medicines#edit
#            medicine GET    /medicines/:id(.:format)                    medicines#show
#                     PATCH  /medicines/:id(.:format)                    medicines#update
#                     PUT    /medicines/:id(.:format)                    medicines#update
#                     DELETE /medicines/:id(.:format)                    medicines#destroy
#        user_clients GET    /users/:user_id/clients(.:format)           clients#index
#                     POST   /users/:user_id/clients(.:format)           clients#create
#     new_user_client GET    /users/:user_id/clients/new(.:format)       clients#new
#         edit_client GET    /clients/:id/edit(.:format)                 clients#edit
#              client GET    /clients/:id(.:format)                      clients#show
#                     PATCH  /clients/:id(.:format)                      clients#update
#                     PUT    /clients/:id(.:format)                      clients#update
#                     DELETE /clients/:id(.:format)                      clients#destroy
#               users GET    /users(.:format)                            users#index
#                     POST   /users(.:format)                            users#create
#            new_user GET    /users/new(.:format)                        users#new
#           edit_user GET    /users/:id/edit(.:format)                   users#edit
#                user GET    /users/:id(.:format)                        users#show
#                     PATCH  /users/:id(.:format)                        users#update
#                     PUT    /users/:id(.:format)                        users#update
#                     DELETE /users/:id(.:format)                        users#destroy
end
