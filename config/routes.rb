Rails.application.routes.draw do
  # create custom links and route helpers for say controller
  get '/new', to: 'says#new'
  post '/create', to: 'says#create'
  get '/quote/:id', to: 'says#edit', as: :edit_quote
  put '/quote/:id', to: 'says#update'
  delete '/quote/:id', to: 'says#destroy', as: :delete_quote

  # loads routes for registeration controller and omniauth
  # we remove '/users' from the link string with the path attribute
  # since we have modified registeration and omniauth controllers we explicitly tell routes to run those
  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: "users/callbacks" }, path: ''

  # homepage
  root to: 'home#index'

  # if user manually tries to enter a url that isnt mentioned in routes, redirect to appropriate action
  get ':not_found', to: 'home#not_found', constraints: { not_found: /.*/ }

end

