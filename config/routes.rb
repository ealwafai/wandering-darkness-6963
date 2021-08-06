Rails.application.routes.draw do
  resources :plots, only: :index
  resources :crops, only: :destroy
  resources :gardens, only: :show
end
