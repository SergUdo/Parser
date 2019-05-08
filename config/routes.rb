Rails.application.routes.draw do
  resources :merchants 
  root  'merchants_lists#index'
  devise_for :users, skip: :registrations
  mount Sidekiq::Web => '/sidekiq'
  resources :merchants_lists, only: %i(index new create)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
