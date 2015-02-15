class Admin::UsersController < Admin::AdminsController
  def index
    @users = User.all.order(:email).page params[:page]
  end

  def new
    @user = User.new
  end

  def create
    params = user_params.dup
    redirect_to new_admin_user_path and return if email_blank? or email_taken? or !password_valid? or !password_match?
    
    user = User.new(params)

    if user.save!
      redirect_to admin_users_path
    else
      flash[:error] = "Error when trying to save. Please try again"
      redirect_to new_admin_user_path
    end
  end

  def search
    @users = User.where("email = ? or first_name = ? or last_name = ?", params[:email], params[:first_name], params[:last_name])
    @users = User.all.order(:email) if @users.empty? && search_params_empty?

    @users = @users.page params[:page]
    render :index
  end

  private
  def search_params_empty?
    [:email, :first_name, :last_name].inject(true) {|result, search_param| result && params[search_param].empty? }
  end

  def user_params
    params.require(:user).permit(:email,
                                 :first_name,
                                 :last_name,
                                 :password,
                                 :password_confirmation,
                                 :admin)
  end

  def password_match?
    is_match = user_params[:password] == user_params[:password_confirmation]
    flash[:error] = "Password not match" unless is_match

    is_match
  end

  def email_blank?
    is_blank = user_params[:email].blank?
    flash[:error] = "Email cannot be blank" if is_blank

    is_blank
  end

  def email_taken?
    is_taken = User.find_by_email(user_params[:email])
    flash[:error] = "Email has been taken" if is_taken

    is_taken
  end

  def password_valid?
    is_valid = !user_params[:password].blank?
    flash[:error] = "Password cannot be blank" unless is_valid

    is_valid
  end
end
