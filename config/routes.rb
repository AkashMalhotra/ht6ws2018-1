Rails.application.routes.draw do
  get 'accessed/index'
  root "home#index"
  get 'callback' => 'callback#gettoken'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
