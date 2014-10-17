class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
  	if session[:user_id].present?
  		User.find(session[:user_id])
  	end
  end

  def logged_in?
  	session[:user_id].present?
  end

  def require_user
  	unless logged_in?
  		flash[:error] = "You need to be logged in"
  		redirect_to new_session_path
  	end
  end

  def current_user_owns_job
  	job = Job.find(params[:id])
  	unless logged_in? and current_user == job.user
  		flash[:error] = "Only the owner can edit"
  		redirect_to job_path(job)
  	end
  end


  helper_method :current_user
  helper_method :logged_in?
  helper_method :require_user

end
