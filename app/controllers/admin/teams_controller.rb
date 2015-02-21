class Admin::TeamsController < Admin::AdminsController
  def index
    @teams = Team.all.page params[:page]
  end
end
