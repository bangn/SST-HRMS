class Admin::UsersController < Admin::AdminsController
  def index
    @users = User.all.page params[:page]
  end

  def search
    @users = User.where("email = ? or first_name = ? or last_name = ?", params[:email], params[:first_name], params[:last_name])
    @users = User.all if @users.empty?

    @users = @users.page params[:page]
    render :index
  end
end
