class ApplicationController < ActionController::Base
  include ApplicationHelper

  def index
    @user = current_user
  end

  private

  def require_login
    return redirect_to login_path unless session.include? :user_id
  end

end
