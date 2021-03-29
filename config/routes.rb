Rails.application.routes.draw do
  resources :expenditures, except: [:show, :update]
  resources :users, defaults: { format: :json }, except: [:destroy, :index]
end
