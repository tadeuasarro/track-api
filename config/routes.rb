Rails.application.routes.draw do
  resources :expenditures, only: [:index]
  resources :users, only: [:show]
end
