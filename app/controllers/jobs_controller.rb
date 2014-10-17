class JobsController < ApplicationController
  def index
  	@jobs = Job.published
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    require_user
  	@user = User.find(params[:user_id])
    @job = @user.jobs.new
  end

  def create
    require_user
    @user = User.find(params[:user_id])
    @job = @user.jobs.new(job_params)
  	if @job.save
  		flash[:success] = "That worked!"
  		redirect_to root_path
  	else
  		flash[:error] = "No. Try again."
  		render :new
  	end
  end

  def edit
    current_user_owns_job
  end

  def update
    current_user_owns_job
    if @job.update(job_params)
      flash[:success] = "All done"
      redirect_to root_path
    else
      flash[:error] = "Nope"
      render :new
    end
  end


  private

  def job_params
  	params.require(:job).permit(:title, :company, :company_url, :job_url, :job_email, :description, :approved)
  end
end
