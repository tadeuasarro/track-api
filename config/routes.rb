Rails.application.routes.draw do
  resources :expenditures
  resources :users, only: [:show]
end
