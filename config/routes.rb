Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      get "/counties", to: "counties#index"
      get "/county", to: "counties#show"
      get "/trails/:id", to: "trails#show"
    end
  end
end
