class User::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_user_layout
  before_filter :set_user
  
  def set_user_layout
    self.class.layout "user/layout"
  end
  
  def update
    if @user.update_without_password user_params
      flash[:notice] = "Your profile has been updated successfully!"
    else
      flash[:error] = "Error when saving your profile. Please try again"
    end

    render :edit
  end
  
  private
  def set_user
    @user = current_user
  end
  
  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name
    )
  end
end
