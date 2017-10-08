Rails.application.routes.draw do
  root "pages#home"

  devise_for :users,
          path: "",
          path_names: {sign_in: "login", sign_out: "logout", edit: "profile"},
          :controllers => { :omniauth_callbacks => "callbacks" }

  resources :users, only: [:show]
  resources :shoes, only: [:show, :index]
end
