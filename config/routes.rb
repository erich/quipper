Quipper::Application.routes.draw do
  resources :tasks do 
    collection do
      post 'filter'
    end
  end

  resources :users

  root to: "users#index"
end
