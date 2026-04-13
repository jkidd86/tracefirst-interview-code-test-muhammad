Rails.application.routes.draw do
  resources :tests
  resources :veterinarians
  resources :animals

  root 'animals#index'
end
