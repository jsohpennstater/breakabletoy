Rails.application.routes.draw do
  resources :questionnaires do
    resources :questions, :assignments
  end
  root 'questionnaires#index'
  resources :questions
  resources :assignments
  devise_for :users
  resources :users
  post "/archive_user", to: "users#archive_user"
end
