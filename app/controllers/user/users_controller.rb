class User::UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :set_user_layout
  before_filter :set_user
  
  def set_user_layout
    self.class.layout "user/layout"
  end
  
  private
  def set_user
    @user = current_user
  end
end
