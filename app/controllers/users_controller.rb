class UsersController < ApplicationController
  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
  		flash[:success] = "Thanks for signing up!"
      session[:user_id] = @user.id
  		redirect_to root_path
  	else
  		flash[:error] = "That didnt work"
  		render :new
  	end
  end

  private
  def user_params
  	params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
  end
end
