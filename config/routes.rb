Rails.application.routes.draw do
  get '/new', to: 'says#new'
  post '/create', to: 'says#create'

  devise_scope :user do
    # since we aren't using devices sign_in and sign_up url we redirect to root path
    get 'register', 'sign_up', 'sign_in', 'signin', to: 'home#not_found'
  end

  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: "users/callbacks" }, path: ''

  root to: 'home#index'

end

