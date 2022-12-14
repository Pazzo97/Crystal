Rails.application.routes.draw do
  devise_scope :user do
    # Redirests signing out users back to sign-in
    get "users", to: "devise/sessions#new"
  end

  devise_for :users  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  root "home#index"

  resources 'categories', only: %w[index new create] do
    resources 'transactions', only: %w[index]
  end

  resources 'transactions', only: %w[new create]
end
