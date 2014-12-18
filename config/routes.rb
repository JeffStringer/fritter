Rails.application.routes.draw do
  root to: 'application#index'

  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :messages
end
