Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # hook up the routes so the localhost:3030 takes us to the landing page
  root 'static_pages#index'
  resources :courses, only: [:index, :show]
  namespace :instructor do
    resources :courses, only: [:new, :create, :show] do
      # we hook the new and create actions by "nesting" the sections underneath the course resource
      resources :sections, only: [:new, :create]
    end
  end
end
