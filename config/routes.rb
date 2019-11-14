Rails.application.routes.draw do
  resources :cocktails do
    resources :doses, only: %i[new create edit update]
  end
  resources :doses, only: %i[destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
