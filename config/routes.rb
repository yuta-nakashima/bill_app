Rails.application.routes.draw do

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: "bills#index"
  resources :users, only: :create
  resources :companies
  resources :bills, only: [:index, :new, :create, :edit, :destroy, :show] do
    resources :invoices, only: [:new, :create, :edit, :destroy]
  end
  get "bills/search"

end
