Rails.application.routes.draw do
  root to: 'questions#index'
  resources :questions, only: [:index, :new, :create, :show] do
    resources :answers, only: :create
  end
end
