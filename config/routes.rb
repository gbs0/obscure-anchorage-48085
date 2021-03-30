require 'sidekiq/web'

Rails.application.routes.draw do
  resources :answears
  resources :questions
  resources :quizzes do
    resources :questions, only: [ :new, :create, :destroy ]
  end
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
  
  authenticate :user, lambda { |u| u.admin? } do
    mount Sidekiq::Web => '/sidekiq'

    namespace :madmin do
    end
end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks" }
  root to: 'home#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
