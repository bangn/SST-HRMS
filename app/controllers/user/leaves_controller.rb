class User::LeavesController < User::UsersController
  def index
    @leaves = Leave.all.order(leave_date: :desc).page params[:page] 
  end

  def new
    @leave = Leave.new
  end

  def create
    @leave = Leave.create(leave_params)
    @leave.user = @user
    @leave.status = State::LEAVE_TYPE[:new]
    if @leave.save
      flash[:notice] = "New leave has been created successfully!"
      redirect_to user_leaves_path
    else
      flash[:error] = "There is an error when creating new leave. Please try again!"
      render :new
    end
  end

  private

  def leave_params
    params.require(:leave).permit(
      :leave_date,
      :leave_type,
      :duration,
      :reason
    )
  end
end
