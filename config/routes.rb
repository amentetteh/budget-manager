# frozen_string_literal: true

Rails.application.routes.draw do
  get 'groups/index'
  get 'groups/new'
  get 'groups/show'
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :welcome, only: [:index]
  resources :groups do
    resources :expenses
  end
  root 'welcome#index'
end
