class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  def require_signin!
    redirect_to new_user_session_path if !current_user
  end
  def authenticate_admin!
    if !current_user
      redirect_to new_user_session_path
    else !current_user.admin?
      flash[:alert] = "Please sign in as admin before continue."
      redirect_to dashboard_path
    end
  end
end
