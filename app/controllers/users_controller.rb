class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
    else
      redirect_to '/signup'
    end
  end
  
  private

  def user_params
    @user_params ||= params.require(:user).permit(:name, :email, :password, :password_confirmation)
    @user_params[:email] = @user_params[:email].downcase.strip
    return @user_params
  end
  
end
