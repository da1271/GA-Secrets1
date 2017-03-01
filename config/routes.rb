Rails.application.routes.draw do

resources :posts

    root to: 'users#new'

    get 'users/new' => 'users#new', as: :new_user
    post 'users' => 'users#create'


    get '/login'     => 'sessions#new'
    post '/login'    => 'sessions#create'
    delete '/logout' => 'sessions#destroy', as: :logout

    get "users/:id/edit" => "users#edit", as: :edit_user
    patch "users/:id" => "users#update"
    delete "posts/:id" => "posts#destroy"


    # get 'posts/new' => 'posts#new', as: :new_post
    # post 'posts' => 'posts#create'



end
