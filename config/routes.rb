Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # hook up the routes so the localhost:3030 takes us to the landing page
  root 'static_pages#index'
end
