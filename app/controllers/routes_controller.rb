class RoutesController < ApplicationController

  before_action :require_login
  before_action :set_route, only: [:show, :edit, :update, :destroy]
  before_action :forbid_if_user_hasnt_been_on_route, only: [:edit, :update, :destroy]


  def index
    @routes = Route.all
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)
    @route.creator = current_user

    if @route.save
      redirect_to route_path(@route)
    else
      render :new
    end
  end

  def show
    @user = current_user
  end

  def edit
  end

  def update
    if @route.update(route_params)
      redirect_to route_path(@route)
    else
      render :edit
    end
  end

  def destroy
    @route.destroy
    redirect_to routes_path
  end

  private

  def route_params
    params.require(:route).permit(:title, :location, :distance, :elevation,
      :description)
  end

  def set_route
    @route = Route.find_by(id: params[:id])
    redirect_if_route_does_not_exist
  end

  def redirect_if_route_does_not_exist
    if @route == nil
      flash[:alert] = 'Route not found'
      return redirect_to routes_path
    end
  end

  def forbid_if_user_hasnt_been_on_route(route)
    return head(:forbidden) unless current_user.been_on_route(@route)
  end

end
