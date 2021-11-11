Rails.application.routes.draw do
  #devise_scope :user do
    #post 'signup', to: 'users/registrations#create'
  #end

  devise_for :users, controllers: { registrations: 'users/registrations', omniauth_callbacks: "users/callbacks" }, path: ''

  root to: 'home#index'

end

