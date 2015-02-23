class Admin::JobsController < Admin::AdminsController
  before_filter :set_job, :only => [:show, :edit, :update, :destroy, :delete]
  def index
    @jobs = Job.all.order(:created_at).page params[:page]
  end
  
  def new
    @job = Job.new
  end
  
  def create
    @job = Job.create(job_params)

    if @job.save
      flash[:notice] = "New job has been created!"
      redirect_to admin_jobs_path
    else
      flash[:error] = "There is an error when saving. Please try again"
      render :new
    end
  end
  
  def destroy
    if @job.destroy
      flash[:notice] = "Job has been deleted successfully!"
    else
      flash[:error] = "Job has not been deleted. Please check again"
    end
    render :nothing => true
  end
  
  private
  def job_params
    params.require(:job).permit(:name)
  end
  
  def set_job
    @job = Job.find(params[:id])
  end
end