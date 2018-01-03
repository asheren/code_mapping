Rails.application.routes.draw do
  resources :surveys

  root to: "users#new"
  get "/auth/:provider/callback" => "sessions#create"
  get "/signout" => "sessions#destroy", :as => :signout
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
