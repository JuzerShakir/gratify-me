Rails.application.routes.draw do
  devise_scope :user do
    # since we aren't using devices sign_in and sign_up url we redirect to root path
    get 'register', 'sign_up', 'create', 'sign_in', 'new', 'signin', to: 'home#not_found'
  end

  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: "users/callbacks" }, path: ''

  root to: 'home#index'

end

