Sprak::Application.routes.draw do
  devise_for :users, :controllers => {:sessions => "sessions"}
  root to: "frontwork#home"

  get "users/index"
  match "users/:id/show" => "users#show", :via => :get, :as => :user
  put "users/disconnect"

  post 'chats/create'
  match "chats/:id/show" => "chats#show", :via => :get, :as => :chat
end
