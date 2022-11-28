Rails.application.routes.draw do
  root to: "majons#index"
  resources :simulations, only: :index
end
