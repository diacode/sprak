class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :set_user_connected

  def set_user_connected
    if user_signed_in?
      current_user.online = true
      current_user.save
    end
  end
end
