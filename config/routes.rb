Rails.application.routes.draw do
  resources :questionnaires
  root 'questionnaires#index'
  devise_for :users
  resources :users
  post "/archive_user", to: "users#archive_user"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
