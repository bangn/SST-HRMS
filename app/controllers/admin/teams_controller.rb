class Admin::TeamsController < Admin::AdminsController
  def index
    @teams = Team.all.order(:name).page params[:page]
  end

  def new
    @team = Team.new
  end

  def create
    @team = Team.create(team_params)

    if @team.save
      flash[:notice] = "New team has been created!"
      redirect_to admin_teams_path
    else
      flash[:error] = "There is an error when saving. Please try again"
      redirect_to new_admin_team_path
    end
  end

  private 
  def team_params
    params.require(:team).permit(:name)
  end
end
