Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  } 
  # User posts routes
  get '/forum' => 'posts#index', as: 'forum'
  get '/users/:user_id/posts/new' => 'posts#new', as: 'new_user_post'
  post '/users/:user_id/posts' => 'posts#create', as: 'user_posts'
  get '/users/:user_id/posts/:id' => 'posts#show', as: 'user_post'
  get '/users/:user_id/posts/:id/edit' => 'posts#edit', as: 'edit_user_post'
  patch '/users/:user_id/posts/:id' => 'posts#update'
  delete '/users/:user_id/posts/:id' => 'posts#destroy'
  
  # Post comments routes
  post '/posts/:post_id/comments' => 'comments#create', as: 'post_comments'
  patch '/posts/:post_id/comments/:id' => 'comments#update', as: 'update_post_comment'
  delete '/posts/:post_id/comments/:id' => 'comments#destroy', as: 'delete_post_comment'

  resources :assignments
  resources :students
  resources :workspace
end
