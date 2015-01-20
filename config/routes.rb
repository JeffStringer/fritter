Rails.application.routes.draw do
  root to: 'application#index'

  resources :users, only: [:index] do
    resources :follows
  end

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :messages, only: [:index, :create]
end
