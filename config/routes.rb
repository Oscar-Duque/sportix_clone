Rails.application.routes.draw do
  get 'pages/home'
  devise_for :users
  root to: '#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sport_sessions, only: %i[index show new create update edit destroy] do
    resources :bookings, only: %i[create]
  end
  resources :bookings, only: %i[destroy] do
    resources :reviews, only: %i[new create]
  end
end
