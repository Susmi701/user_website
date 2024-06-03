class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy ]
  before_action :require_user,only: [:edit,:update,:destroy]
  before_action :require_same_user,only: [:destroy,:edit,:update]

  def index
    @users = User.paginate(page: params[:page], per_page: 10)
  end

  def show   
  end

  def new
    @user = User.new
  end

  def edit    
  end 

  def create  
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User was created successfully"
      if !logged_in
        redirect_to login_path
      else
        redirect_to users_path
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update    
    if @user.update(user_params)
    flash[:notice] = "User was edited successfully"
    redirect_to users_path
   else
    render :edit, status: :unprocessable_entity
   end
  end

  def destroy
    @user.destroy
    session[:current_user_id]=nil if @user == current_user
    redirect_to users_path
  end


  private
  
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end
  
  def set_user
    @user= User.find(params[:id])
  end

  def require_same_user
    if current_user != @user
      flash[:notice] = "You cannot edit or delete this user"
      redirect_to users_path
    end
  end

end
