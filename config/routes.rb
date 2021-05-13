Rails.application.routes.draw do

  devise_for :users

  root to: 'homes#top'
  
  
  resources :users, only: [:new, :index, :show, :edit,]
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
