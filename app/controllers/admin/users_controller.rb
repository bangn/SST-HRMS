class Admin::UsersController < Admin::AdminsController
  def index
    @users = User.all
  end

  def search
    @users = User.where("email = ? or first_name = ? or last_name = ?", params[:email], params[:first_name], params[:last_name])
    @users = User.all if @users.empty?
    render :index
  end
end
