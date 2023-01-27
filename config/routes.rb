Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root to: "lists#index"
  resources :lists, except: [:edit, :update] do
    resources :bookmarks, only: [:new, :create]
    # resources :reviews, only: :create
  end
  resources :bookmarks, only: :destroy
  # resources :reviews, only: :destroy
  get 'delete_list/:id', to: 'lists#destroy', as: 'delete_list'
  get 'delete_bookmarks/:id', to: 'bookmarks#destroy', as: 'delete_bookmark'

  # resources: model - gives you all CRUD
end
