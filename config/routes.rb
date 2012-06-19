Quipper::Application.routes.draw do

  resources :users do
    resources :tasks do 
      collection do
        post 'search_and_filter'
      end
    end
  end

  root to: "users#index"
end
