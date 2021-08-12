Rails.application.routes.draw do
  require 'sidekiq/web'
  # For details on the SL available within this file, see https://guides.rubyonrails.org/routing.html
  mount Sidekiq::Web => '/sidekiq'
  root to: "pages#index"

  resources :players, except: [:show] do
    member do
      patch :change_status
    end
  end
end
