Rails.application.routes.draw do
  resources :photos, only: [:index, :show]
  root 'search#index'
end
