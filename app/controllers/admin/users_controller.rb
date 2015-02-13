class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def search
    @users = User.where("email = ?", params[:email])
    @users = User.all if @users.empty?
    render :index
  end
end
