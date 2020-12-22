Rails.application.routes.draw do
  namespace :api do
    post "/users" => "users#create"
    get "/users" => "users#index"
    get "/users/:id" => "users#show"
    post "/sessions" => "sessions#create"

    post "/matches" => "matches#create"
    get "/matches" => "matches#index"
    get "/matches/:id" => "matches#show"
  end
end
