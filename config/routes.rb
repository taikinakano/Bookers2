Rails.application.routes.draw do

  devise_for :users
  get 'homes/top'
  resources :users, only: [:index, :edit]
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
