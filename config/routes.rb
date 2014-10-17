Rails.application.routes.draw do


  resource :session
  resources :jobs
  resources :users do
  	resources :jobs, only: [:new, :create]
  end

  root "jobs#index"

end
