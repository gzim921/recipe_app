Rails.application.routes.draw do

  root to: 'recipes#index'

  resources :users, except: [:new] do
    resources :recipes, only: [:show]
  end

  resources :recipes, except: [:show] do
    get 'edit_instructions', to: 'recipes#edit_instructions'
    get 'edit_ingredients', to: 'recipes#edit_ingredients'
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
