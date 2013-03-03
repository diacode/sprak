class UsersController < ApplicationController
  def index

    @users = User.all

    if params[:language]
      @lang = Language.find(params[:language])
      @users = @users.native(@lang)
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
