Rails.application.routes.draw do


  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resource :session
  resources :jobs
  resources :users do
  	resources :jobs, only: [:new, :create]
  end

  root "jobs#index"

end
