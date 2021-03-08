Rails.application.routes.draw do
  resources :expenditures, only: [:index, :create]
  resources :users, except: [:delete, :index]
end
