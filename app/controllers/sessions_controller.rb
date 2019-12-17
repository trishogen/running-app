class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    return head(:forbidden) unless params[:password] == @user.password
    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    session.delete :user_id if session[:user_id]
    redirect_to login_path
  end

end
