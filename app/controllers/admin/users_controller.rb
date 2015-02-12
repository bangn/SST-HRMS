class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def search
    @users = User.where("email = ?", params[:email])
    render :index
  end
end
