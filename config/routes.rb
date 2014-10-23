Rails.application.routes.draw do


	get '/about' => 'pages#about'
	get '/freelance' => 'pages#freelance'
  get '/projects' => 'pages#projects'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  resource :session
  resources :jobs
  resources :users do
  	resources :jobs, only: [:new, :create]
  end

  root "jobs#index"

end
