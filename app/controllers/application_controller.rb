class ApplicationController < ActionController::Base

  def index
  end

  private

  def require_login
    return redirect_to login_path unless session.include? :user_id
  end
end
