SeattlerbOrg::Application.routes.draw do
  resources :suggestions, :only => [:index, :new, :create]

  resources :helps

  mount RailsAdmin::Engine => '/adminsrb', :as => 'rails_admin'

  devise_for :users

  get "talks/checklist" => "talks#checklist"

  get "/talks/past" => "talks#past"

  resources :talks
  resources :dudes, :path => 'people', :only => [:new, :create, :index]

  post "/newsletter" => "newsletter#subscribe", as: :subscribe

  match "/projects" => "about#projects", as: :projects
  match "/join-us"  => "about#join_us",  as: :join_us

  root :to => "about#index"
end
