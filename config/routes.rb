Rails.application.routes.draw do
  resources :books, only: :index
  resources :authors, only: :show do
    resources :books, only: [:new, :create]
  end
end
