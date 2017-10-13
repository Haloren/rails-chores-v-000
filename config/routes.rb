Rails.application.routes.draw do

  get 'house/index'

  get 'house/show'

  root 'chores#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get "/auth/:provider/callback" => "sessions#create"
  get '/logout' => 'sessions#destroy'

  resources :sessions
  resources :users
  resources :user_chores
  resources :houses
  
  get 'tasks/create'


  resources :chores do
    resources :tasks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
