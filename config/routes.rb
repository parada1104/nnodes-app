Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "pages#index"
  resources :players, except: [:show] do
    member do
      patch :change_status
    end
  end
end
