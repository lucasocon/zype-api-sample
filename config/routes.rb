Rails.application.routes.draw do

  root to: 'videos#index'

  post 'sessions/create'
  get 'sessions/remove'
  get 'sessions/error'

  resources :videos
end
