Rails.application.routes.draw do



  get root to: 'homes#top'
  devise_for :users
  get 'homes/about'=>'homes#about',as: 'about'
  resources :books, only: [:index, :show, :create,:edit]
  resources :users, only: [:index, :show, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
