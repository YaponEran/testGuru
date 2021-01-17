Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  devise_for :users, path: 'gurus', path_names: { sign_in: :login, sign_out: :logout }

  root 'tests#index'

  resources :tests only: :index do 
    member do 
      post :start
    end
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, exept: :index do
        resources :answers, shallow: true, exept: :index
      end
    end
  end

end
