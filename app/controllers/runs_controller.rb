class RunsController < ApplicationController
  include RunsHelper

  before_action :require_login, :set_user
  before_action :set_all_routes, only: [:new, :create, :edit]
  before_action :set_run, only: [:show, :edit, :update, :destroy]
  before_action :forbid_if_user_hasnt_been_on_run, only: [:show, :edit, :update, :destroy]


  def index
    @runs = @user.runs
  end

  def show
  end

  def new
    @run = @user.runs.build
  end

  def create
    @run = @user.runs.build(run_params)

    if @run.save
      redirect_to user_run_path(@user, @run)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @run.update(run_params)
      redirect_to user_run_path(current_user, @run)
    else
      render :edit
    end
  end

  def destroy
    @run.destroy
    redirect_to user_runs_path(current_user)
  end

  def total_run_time
    @total_time = Run.total_run_time
  end


  private

  def run_params
    params.require(:run).permit(:user_id, :route_id, :title, :mood, :run_time,
      :date, :notes, :conditions)
  end

  def set_user
    @user = current_user
  end

  def set_all_routes
    @routes = Route.all
  end

  def set_run
    @run = Run.find_by(id: params[:id])
    redirect_if_run_does_not_exist
  end

  def forbid_if_user_hasnt_been_on_run
    return head(:forbidden) unless current_user.been_on_run(@run)
  end

  def redirect_if_run_does_not_exist
    if @run == nil
      flash[:alert] = 'Run not found'
      return redirect_to user_runs_path(current_user)
    end
  end

end
