Quipper::Application.routes.draw do

  resources :users do
    resources :tasks do 
      collection do
        post 'filter'
      end
    end
  end

  root to: "users#index"
end
