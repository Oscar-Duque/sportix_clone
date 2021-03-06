Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sport_sessions do
    resources :bookings, only: %i[create]
  end
  resources :bookings, only: %i[destroy] do
    resources :reviews, only: %i[new create]
  end

  resources :users, only: %i[show] do
    resources :bookings, only: %i[index]
  end

  resources :users, only: %i[show] do
    member do
      get :aboutme
    end
  end
end
