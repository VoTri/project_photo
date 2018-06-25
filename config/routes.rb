Rails.application.routes.draw do
  mount Ckeditor::Engine => "/ckeditor"
  post '/rate' => 'rater#create', :as => 'rate'
  resources :photos
  resources :categories
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {registrations: 'registrations'}
  root "home#index"
  resources :photos, only: :show do
    resources :comments
  end
  get '/comments/new/(:parent_id)', to: 'comments#new', as: :new_comment
  resources :comments
end
