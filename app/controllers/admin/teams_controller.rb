class Admin::TeamsController < Admin::AdminsController
  before_filter :set_team, :only => [:show, :edit, :update, :destroy, :delete]
  
  def index
    @teams = Team.all.order(:name).page params[:page]
  end

  def new
    @team = Team.new
  end
  
  def create
    @team = Team.create(team_params)

    if @team.save
      flash[:notice] = "#{@team.name} team has been created!"
      redirect_to admin_teams_path
    else
      flash[:error] = "There is an error when saving. Please try again"
      render :new
    end
  end
  
  def update
    if @team.update team_params
      flash[:notice] = "#{@team.name} has been updated successfully!"
      redirect_to admin_teams_path
    else
      flash[:error] = "Error when updating team. Please try again"
      render :edit
    end
  end
  
  def destroy
    team_name = @team.name
    team_id = @team.id
    if @team.destroy
      remove_team_id_of @team.members, team_id
      remove_team_id_of @team.jobs, team_id
      flash[:notice] = "#{team_name} has been successfully deleted!"
    else
      flash[:error] = "Error when deleting #{team_name}. Please try again"
    end
    
    render nothing: true #ajax call will reload index page
  end

  private 
  def team_params
    params.require(:team).permit(:name)
  end
  
  def set_team
    @team = Team.find(params[:id])
  end
  
  def remove_team_id_of(resources, team_id)
    resources.each do |resource|
      resource.update :team_id => nil
    end
  end
end
