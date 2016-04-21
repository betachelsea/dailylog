Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: "omniauth_callbacks",
    sessions: "sessions"
  }
  root 'home#index'
  get 'home/index'
  devise_scope :user do
    get "sign_in", to: "devise/sessions#new"
    delete "sign_out", to: "devise/sessions#destroy", as: :destroy_user_session
  end
end
