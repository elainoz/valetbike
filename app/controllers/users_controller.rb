class UsersController < ApplicationController
   
    def list_user
       @users = User.all.order(identifier: :asc)
    end
   
 

  # for the sign up page
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path
      
    else
      render :new
    end
  end
  
  
  def show
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:username, :password)
  end
  
end
