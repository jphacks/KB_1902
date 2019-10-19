Rails.application.routes.draw do
	devise_for :users, controllers: {
        sessions: 'users/sessions',
        registrations: 'users/registrations'
      }
  resources :users
  post "/callback" => "posts#callback"
  root 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
  resources :comments
  end
  resources :genres

end
