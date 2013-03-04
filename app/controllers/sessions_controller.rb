class SessionsController < Devise::SessionsController
  before_filter :set_user_offline!, :only => :destroy
    def set_user_offline!
      current_user.online = false
      current_user.save
    end
end