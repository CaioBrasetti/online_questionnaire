Rails.application.routes.draw do
  devise_for :users
  root to: "psychologists#index"

  resources :psychologists, only: [:index]
  resources :evaluateds do
    collection do
      post 'send_mail'
      get :show
    end
  end

  resources :evaluation_interaction do
    member do
      get :show
      post :submit
      get :confirmation
      get :validate_patient
      post :check_patient
      get :validate
    end
  end
  resources :questionnaires
  resources :questionnaires_sent

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
