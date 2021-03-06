Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, 
             controllers: { sessions: 'sessions' },
             path: 'gurus', 
             path_names: { sign_in: :login, sign_out: :logout }

  root 'tests#index'

  resources :tests, only: :index do 
    member do 
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
      post :gist
    end
  end

  namespace :admin do
    resources :badges

    resources :tests do
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true, except: :index
      end
    end
    resources :gists, only: %i[index]
  end

  get 'feedbacks', to: 'feedback#new'
  post 'feedbacks', to: 'feedback#create' 

  # get "users", to: "users#show"
  get 'badges', to: 'user_badges#index'


end
