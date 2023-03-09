Rails.application.routes.draw do
  root 'emails#index'
  resources :emails
  post 'emails/:id/toggle', to: 'emails#toggle'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
