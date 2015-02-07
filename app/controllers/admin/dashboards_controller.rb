class Admin::DashboardsController < ApplicationController
  before_action :authenticate_user!, :authenticate_admin!
end
