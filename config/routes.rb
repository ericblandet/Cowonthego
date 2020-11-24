Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :workspaces, only: [:index, :show, :new, :create]
  resources :bookings
  authenticated :user do
    root 'bookings#index', as: 'authenticated_root'
  end
  root to: 'pages#home'
end
