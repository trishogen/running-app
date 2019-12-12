class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    session[:user_id] = @user.id
    redirect_to '/'
  end

end
