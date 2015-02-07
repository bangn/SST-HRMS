class Admin::DashboardsController < ApplicationController
  before_action :require_signin!, :authenticate_admin!
end
