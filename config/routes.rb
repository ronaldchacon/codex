Codex::Application.routes.draw do

  resources :wikis

  resources :charges

  devise_for :users

  match "about" => 'welcome#about', via: :get

  root to: 'welcome#index'
end
