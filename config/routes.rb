Rails.application.routes.draw do
  resources :users
  get 'users/new'
  get 'accessed/index' => 'accessed#index'
  get 'accessed/deposit' => 'accessed#deposit'
  root "home#index"
  get 'callback' => 'callback#gettoken'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
