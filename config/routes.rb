Rails.application.routes.draw do
  resources :expenditures, except: [:show, :update]
  resources :users, except: [:destroy, :index]
end
