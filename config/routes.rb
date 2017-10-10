Rails.application.routes.draw do

  root 'chores#index'
  get '/signin', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'

  resources :sessions
  resources :users
  resources :user_chores
  get 'tasks/create'


  resources :chores do
    resources :tasks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
