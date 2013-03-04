Sprak::Application.routes.draw do
  devise_for :users, :controllers => {:sessions => "sessions"}
  root to: "frontwork#home"

  resources :users, only: [:index, :show] do
    collection do
      put 'disconnect' # for current_esr
    end
  end

  post 'chats/create'
  match "chats/:id/show" => "chats#show", :via => :get, :as => :chat
end
