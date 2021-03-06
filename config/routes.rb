Rails.application.routes.draw do
  resources :expenditures, only: [:index, :create]
  resources :users, only: [:show, :create]
end
