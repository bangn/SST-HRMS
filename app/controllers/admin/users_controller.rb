class Admin::UsersController < Admin::AdminsController
  before_filter :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end
  
  def create    
    @user = User.create(user_params)

    if @user.save
      flash[:notice] = "New user has been created!"
      UserMailer.welcome_to_strongtie(@user).deliver
      redirect_to admin_users_path
    else
      flash[:error] = "Error when trying to save. Please try again"
      render :new
    end
  end

  def index
    @users = User.all.order(:email).page params[:page]
  end
  
  def update
    sanitize_user_params
    if @user.update user_params
      flash[:notice] = "User has been updated successfully!"
      redirect_to admin_users_path
    else
      flash[:error] = "Error when trying to update #{@user.email}. Please try again"
      render :edit
    end
  end
  
  def destroy
    if @user != current_user
      @user.destroy
      flash[:notice] = "User has been deleted successfully!"
    else
      flash[:error] = "You can't delete yourself!"
    end
    
    render nothing: true #ajax call will reload index page
  end

  def search
    @users = User.where("email = ? or first_name = ? or last_name = ?", params[:email], params[:first_name], params[:last_name])
    @users = User.all.order(:email) if @users.empty? && search_params_empty?

    @users = @users.page params[:page]
    render :index
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def search_params_empty?
    [:email, :first_name, :last_name].inject(true) {|result, search_param| result && params[search_param].empty? }
  end

  def user_params
    params.require(:user).permit(:email,
                                 :first_name,
                                 :last_name,
                                 :password,
                                 :password_confirmation,
                                 :admin,
                                 :team_id)
  end
  
  def sanitize_user_params
    if user_params[:password].blank?
      user_params.delete :password
      user_params.delete :password_confirmation
    end
  end
end
