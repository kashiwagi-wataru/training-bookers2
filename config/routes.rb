Rails.application.routes.draw do
  devise_for :users

  resources:books,only:[:new,:create,:index,:show,:destroy,:edit,:update]do
    resource:post_comments,only:[:create, :destroy]
  end
  get '/about' => 'books#about'
  root to: 'books#home'

  resources :users, only: [:show,:edit,:update,:index]

  get '/ransack'=> 'books#ransack'


end
