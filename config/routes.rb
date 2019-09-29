Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # hook up the routes so the localhost:3030 takes us to the landing page
  resource :dashboard, only: [:show]
  root 'static_pages#index'
  # we hook the enrollments and create actions by "nesting" it under the course resource
  resources :courses, only: [:index, :show] do
    resources :enrollments, only: :create
  end
  resources :lessons, only: [:show]
  namespace :instructor do
    resources :lessons, only: [:update]
    resources :sections, only: [:update] do
      resources :lessons, only: [:create]
    end
    resources :courses, only: [:new, :create, :show] do
      # we hook the new and create actions by "nesting" the sections underneath the courses resource
      resources :sections, only: [:create]
    end
  end
end
