Rails.application.routes.draw do
  get 'bookings/show'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :dogs, only: [ :show, :index, :new, :create, :edit, :update ] do
    resources :bookings, only: [ :create ]
  end
  resources :bookings, only: [ :index, :edit, :update ] do
    resources :reviews, only: [ :new, :create ]
  end
end
