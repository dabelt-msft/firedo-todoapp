Rails.application.routes.draw do

  resources :sessions

  get 'welcome/index'

  get 'cities/:state', to: 'application#cities'

  get '/register' => 'users#create'

  get '/add_todo_item' => 'todos#new'

  get '/login' => 'sessions#new'

  post  '/login' => 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  root 'welcome#index'
  
end
