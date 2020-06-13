Rails.application.routes.draw do
  get 'payments/index'
  devise_for :users
  root to: 'pages#home'
  resources :payments
  resources :clients do
    resources :projects
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
