class RunsController < ApplicationController
  before_action :require_login

  def index
    @user = current_user
    @runs = @user.runs
  end

  def show
    @run = Run.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @routes = Route.all
    @run = @user.runs.build
  end

  def create
    @user = User.find(params[:run][:user_id])
    @run = @user.runs.create(run_params)
    redirect_to user_run_path(@user, @run)
  end

  private

  def run_params
    params.require(:run).permit(:user_id, :route_id, :mood, :run_time, :date, :notes)
  end
end
