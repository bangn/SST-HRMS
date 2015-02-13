class Admin::AdminsController < ApplicationController
  before_filter :authenticate_admin!
  before_filter :set_admin_layout
  def authenticate_admin!
    unless current_user && current_user.admin?
      flash[:error] = "Only administrators can view admin pages"
      redirect_to dashboard_path
    end
  end

  def set_admin_layout
    self.class.layout "admin/admin"
  end
end
