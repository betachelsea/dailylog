Rails.application.routes.draw do
  root 'home#index'
  get 'home/index'
  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
    delete "sign_out", to: "devise/sessions#destroy", as: :destroy_user_session
  end
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks",
    sessions: "sessions"
  }

  resources :daily_reports
  resources :tasks
  resources :task_logs, only: [:create]
end
