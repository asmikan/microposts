class UsersController < ApplicationController
  
  def show 
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
    
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App!" 
      redirect_to @user  
    else
      render 'new'
    end
  end
 
 def edit
   @user = User.find(params[:id])
   check_user(@user)
 end
 
 # http://servername/users/4/update
 def update
   @user = User.find(params[:id])
   check_user(@user)
   if @user.update(user_profile)
     flash[:success] = "Update was successful"
     redirect_to @user
  else
     render 'edit'
  end
 end
 
  def followings
     @user = User.find(params[:id])
     @followings= @user.following_users
     
  end
 
  def followers
     @user = User.find(params[:id])
     @followers= @user.follower_users
  end
     
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
  end
  
  def user_profile
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,
                                 :location, :profile)
  end  

  def check_user(user)
   # current_userはログイン済みユーザー userは編集対象
   if (current_user != user)
     redirect_to root_path
   end
  end


end  
