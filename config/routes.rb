Rails.application.routes.draw do
  namespace :api do
    root :to => "sessions#create"
    post "/users" => "users#create"
    patch "/users/:id" => "users#update"
    get "/users" => "users#index"
    get "/users/:id" => "users#show"
    post "/sessions" => "sessions#create"
    delete "/users/:id" => "users#destroy"

    post "/matches" => "matches#create"
    get "/matches" => "matches#index"
    get "/matches/:id" => "matches#show"
    patch "/matches/:id" => "matches#update"
  end
end
