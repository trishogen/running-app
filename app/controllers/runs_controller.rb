class RunsController < ApplicationController
  before_action :require_login

  def index
    @user = current_user
    @runs = @user.runs
  end

  def show
    @user = User.find(params[:user_id])
    @run = Run.find(params[:id])
  end

  def new
    @user = User.find(params[:user_id])
    @routes = Route.all
    @run = @user.runs.build
  end

  def create
    @user = User.find(params[:run][:user_id])
    @run = @user.runs.build(run_params)
    @routes = Route.all

    if @run.save
      redirect_to user_run_path(@user, @run)
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:user_id])
    @run = Run.find(params[:id])
    @routes = Route.all
  end

  def update
    @run = Run.find(params[:id])
    @run.update(run_params)
    redirect_to user_run_path(@run)
  end

  def destroy
    Run.find(params[:id]).destroy
    redirect_to user_runs_path(current_user)
  end

  private

  def run_params
    params.require(:run).permit(:user_id, :route_id, :mood, :run_time, :date, :notes)
  end
end
