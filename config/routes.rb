Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :workspaces, only: [:index, :show, :new, :create] do
    resources :bookings, only:[:new, :create]
  end
  resources :bookings, only: [:index, :destroy]
  root to: 'pages#home'
end
