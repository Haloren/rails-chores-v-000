Rails.application.routes.draw do


  root :to => "welcome#home"

  get '/sign_up' => 'users#new'
  get '/login'   => 'sessions#new'
  post '/login'   => 'sessions#create'
  delete '/logout'  => 'sessions#destroy'
  get '/auth/:provider/callback' => 'sessions#create'
  get '/overdue' => 'user_chores#show'

  resources :users
  resources :user_chores
  resources :houses
  resources :chores

  # get 'tasks/create'


  resources :house_chores do
    resources :tasks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
