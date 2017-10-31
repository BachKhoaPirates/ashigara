Rails.application.routes.draw do

  root "shoes#index"

  devise_for :users,
          path: "",
          path_names: {sign_in: "login", sign_out: "logout", edit: "profile"},
          :controllers => { :omniauth_callbacks => "callbacks" }

  resources :users, only: [:show, :update]
  resources :reviews, only: [:show]

  resources :shoes, only: [:show, :index] do
    resources :reviews
  end

  resources :reviews do
    resources :bookmarks, only: [ :create, :destroy ]
    resources :votes, only: [ :create, :destroy ]
  end

end
