Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "companies#index"
  resources :companies, only: [:show, :new, :create]
  resources :users, only: :create
  resources :bills, only: [:index, :new, :create, :edit, :destroy]
  resources :invoices, only: [:new, :create, :edit, :destroy]

end
