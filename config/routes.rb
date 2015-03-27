Rails.application.routes.draw do
  resources :dishes
  root to: 'dishes#index'
end
