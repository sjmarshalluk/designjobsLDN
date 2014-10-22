class JobsController < ApplicationController
  def index
  	@jobs = Job.order(created_at: :desc).published
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
  		flash[:success] = "Thanks for submitting your job! Your listing should be live within the next 24 hours, and we'll drop you an email when it is."
  		redirect_to root_path
  	else
  		flash[:error] = "No. Try again."
  		render :new
  	end
  end

  def edit
    current_user_owns_job
    @job = Job.find(params[:id])
  end

  def update
    current_user_owns_job
    @job = Job.find(params[:id])
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
  	params.require(:job).permit(:title, :company, :company_url, :job_url, :job_email, :description, :approved, :area_of_london, :salary, :how_to_apply)
  end
end
