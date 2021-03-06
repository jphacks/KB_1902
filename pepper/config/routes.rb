Rails.application.routes.draw do
	devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  resources :users
  resources :favos, only: [:index]
  post "/callback" => "posts#callback"
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "posts/search" => "posts#search"
  resources :posts do
  resources :comments
  resource :favos, only: [:create, :destroy]
  end
  resources :genres

end
