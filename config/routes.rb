Rails.application.routes.draw do
  resources :questionnaires do
    resources :questions, :assignments
  end

  root 'questionnaires#index'
  resources :questions
  resources :assignments
  resources :questionnaires
  devise_for :users
  resources :users
  post "/archive_user", to: "users#archive_user"

  resources :questionnaires do
    resources :questions do
      post "/scaleone", to: "questions#scaleone", as: "scaleone"
      post "/scaletwo", to: "questions#scaletwo", as: "scaletwo"
      post "/scalethree", to: "questions#scalethree", as: "scalethree"
      post "/scalefour", to: "questions#scalefour", as: "scalefour"
      post "/scalefive", to: "questions#scalefive", as: "scalefive"
    end
  end

end
