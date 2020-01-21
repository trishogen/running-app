class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def create
    if auth
      @user = User.find_by(email: auth['info']['email'])
      if @user.nil?
        @user = User.new(email: auth['info']['email'], uid: auth['uid'],
          first_name: auth['info']['first_name'])
        @user.save
      end
    else
      @user = User.find_by(email: params[:user][:email])
      return head(:forbidden) unless params[:password] == @user.password
    end

    session[:user_id] = @user.id
    redirect_to root_path
  end

  def destroy
    session.delete :user_id if session[:user_id]
    redirect_to login_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
