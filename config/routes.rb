Rails.application.routes.draw do
  resources :sessions
  resources :todos

  resources :users do
    resources :todos
  end

  get '/register' => 'users#new'

  get '/add_todo_item' => 'todos#new'

  get '/login' => 'sessions#new'

  post  '/login' => 'sessions#create'

  get '/logout', to: 'sessions#destroy'

  get '/', to: 'welcome#index'

  root 'welcome#index'
end
