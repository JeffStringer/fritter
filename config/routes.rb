Rails.application.routes.draw do
  root to: 'application#index'

  resources :users, only: [:index]
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :messages
end
