Quipper::Application.routes.draw do
  resources :tasks

  get "posts/index"

  get "posts/create"

  get "posts/update"

  resources :users

  root to: "home#index"
end
