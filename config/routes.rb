Rails.application.routes.draw do
  root to: 'cocktails#index'
  resources :cocktails, except: [:index] do
    resources :doses, only: %i[new create]
  end
  resources :doses, only: %i[edit update destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
