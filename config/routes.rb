Sprak::Application.routes.draw do
  devise_for :users

  root to: "frontwork#home"
end
