class UsersController < ApplicationController
  def index
    @users = User

    @users = @users.where("id <> ?", current_user.id) if user_signed_in?

    if params[:language]
      @lang = Language.find(params[:language])
      @users = @users.native(@lang)
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def disconnect
    current_user.online = false
    current_user.save
    render :nothing => true, :status => 200, :content_type => 'text/html'
  end
end
