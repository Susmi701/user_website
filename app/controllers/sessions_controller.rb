class SessionsController < ApplicationController

  def new
  end

  def create
  @user =User.find_by(email: params[:session][:email].downcase)
  if @user && @user.authenticate(params[:session][:password])
    session[:current_user_id]=@user.id
    redirect_to users_path
  else
    flash.now[:danger] = "Login Failed"
    render :new, status: :unprocessable_entity
  end
  end

  def destroy
    session[:current_user_id]=nil
    flash[:notice] = "You have successfully logged out."
    redirect_to login_path
  end
  
end
