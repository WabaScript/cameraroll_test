Rails.application.routes.draw do
  root to: 'albums#index'
  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]
  resources :users, controller: "users" do
    resource :password,
      controller: "clearance/passwords",
      only: [:edit, :update]
  end
  resources :albums

  # login/out actions
  get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"
  get "/sign_up" => "clearance/users#new", as: "sign_up"

  # follow/unfollow actions
  post '/users/:id/follow', to: "users#follow", as: "follow_user"
  post '/users/:id/unfollow', to: "users#unfollow", as: "unfollow_user"

  put '/albums/:id/earn_coin_for_view', to: "albums#earn_coin_for_view", as: "earn_coin_for_view"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
