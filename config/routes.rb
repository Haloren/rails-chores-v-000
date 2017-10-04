Rails.application.routes.draw do
  root 'chores#index'
  resources :chores do
    resources :tasks
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
