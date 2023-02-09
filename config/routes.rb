Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get "/counties", to: "counties#index"
      get "/county", to: "counties#show"
      get "/users", to: "users#index"
      get "/user", to: "users#show"
      post "/user-trails", to: "user_trails#create"
      get "/trail", to: "trails#show"
      
    end
  end
end
