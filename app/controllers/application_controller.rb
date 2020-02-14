class ApplicationController < ActionController::Base
  include ApplicationHelper

  def index
    @user = current_user
  end

  def stats
    @user_most_miles = User.most_miles_run
    @total_time = Run.total_run_time
    @most_popular_route = Route.most_popular_route
  end

  private

  def require_login
    return redirect_to login_path unless session.include? :user_id
  end

end
