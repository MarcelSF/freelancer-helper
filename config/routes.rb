Rails.application.routes.draw do
  get 'projects/new'
  get 'payments/index'
  devise_for :users
  root to: 'pages#home'
  get '/facts', to: 'pages#facts', as: :facts
  resources :payments
  resources :clients do
    resources :projects
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
