class Admin::AdminsController < ApplicationController
  before_filter :authenticate_admin!
  def authenticate_admin!
    unless current_user && current_user.admin?
      flash[:error] = "Only administrators can view admin pages"
      redirect_to dashboard_path
    end
  end
end
