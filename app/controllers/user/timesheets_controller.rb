class User::TimesheetsController < User::UsersController
  before_filter :set_timesheet, only: [:update, :show, :edit, :destroy]
  def index
    @timesheets = Timesheet.where(user_id: @user.id).order(:working_date).page params[:page]
  end
  
  def new
    @timesheet = Timesheet.new
  end
  
  def create
    @timesheet = Timesheet.create(timesheet_params)
    @timesheet.user = @user
    if @timesheet.save
      flash[:notice] = "New work log has been created successfully!"
      redirect_to user_timesheets_path
    else
      flash[:error] = "Error when creating work log. Please try again"
      render :new
    end
  end
  
  def update
    if @timesheet.update timesheet_params
      flash[:notice] = "Work log has been updated successfully!"
      redirect_to user_timesheets_path
    else
      flash[:notice] = "Error when updating work log. Please try again"
      render :edit
    end
  end
  
  private
  def timesheet_params
    params.require(:timesheet).permit(
      :description,
      :working_date,
      :duration
    )
  end
  
  def set_timesheet
    @timesheet = Timesheet.find(params[:id])
  end
end
