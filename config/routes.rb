Rails.application.routes.draw do
  resources :plots, only: :index
  resources :crops, only: :destroy
end
