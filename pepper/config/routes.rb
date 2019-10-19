Rails.application.routes.draw do
  get 'genre/create'
  get 'genre/new'
  get 'genre/destroy'
  get 'posts/index'
  get 'posts/show'
  get 'posts/create'
  get 'posts/destroy'
  get 'posts/update'
  get 'posts/edit'
  get 'posts/new'
  get 'comments/create'
  get 'comments/destroy'
  get 'comments/resources'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
