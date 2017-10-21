Rails.application.routes.draw do


  root :to => "welcome#home"

  get '/sign_up' => 'users#new'
  get '/login'   => 'sessions#new'
  get '/logout'  => 'sessions#destroy'
  get '/overdue' => 'user_chores#show'

  resources :users
  resources :user_chores
  resources :houses
  resources :house_chores

  get 'tasks/create'


  resources :chores do
    resources :tasks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
