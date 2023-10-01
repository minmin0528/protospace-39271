Rails.application.routes.draw do
 root to: "prototypes#index"
 devise_for :users

 resources :prototypes do
  resources :comments, only: :create
 end
 resources :users, only: :show
 
 resources :prototypes, except: [:destroy]
 delete 'prototypes/:id', to: 'prototypes#destroy', as: :destroy_prototype
end