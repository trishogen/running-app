class RunsController < ApplicationController
  include RunsHelper

  before_action :require_login

  def index
    @user = current_user
    @runs = @user.runs
  end

  def show
    @user = current_user
    @run = @user.runs.find_by(id: params[:id])

    redirect_if_user_hasnt_been_on_run(@run)
  end

  def new
    @user = current_user
    @routes = Route.all
    @run = @user.runs.build
  end

  def create
    @user = current_user
    @run = @user.runs.build(run_params)
    @routes = Route.all

    if @run.save
      redirect_to user_run_path(@user, @run)
    else
      render :new
    end
  end

  def edit
    @run = Run.find(params[:id])
    @user = current_user
    @routes = Route.all

    forbid_if_user_hasnt_been_on_run(@run)
  end

  def update
    @run = Run.find(params[:id])
    forbid_if_user_hasnt_been_on_run(@run)

    if @run.save
      redirect_to user_run_path(current_user, @run)
    else
      render :edit
    end
  end

  def destroy
    @run = Run.find(params[:id])
    forbid_if_user_hasnt_been_on_run(@run)

    @run.destroy
    redirect_to user_runs_path(current_user)
  end

  def total_run_time
    @total_time = Run.total_run_time
  end


  private

  def run_params
    params.require(:run).permit(:user_id, :route_id, :title, :mood, :run_time,
      :date, :notes)
  end
end
