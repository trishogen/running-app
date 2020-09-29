class RoutesController < ApplicationController

  before_action :require_login
  before_action :set_route, only: [:show, :edit, :update, :destroy]
  before_action :forbid_if_not_creator, only: [:edit, :update, :destroy]


  def index
    @routes = Route.all
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)
    @route.creator = current_user

    @route.save ? (redirect_to route_path(@route)) : (render :new)
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
    # helper to find a given route by id param of page accessed
    @route = Route.find_by(id: params[:id])
    redirect_if_route_does_not_exist
  end

  def redirect_if_route_does_not_exist
    # check if someone is trying to access a page that doesn't exist & redirect
    if @route.nil?
      flash[:alert] = 'Route not found'
      return redirect_to routes_path
    end
  end

  def forbid_if_not_creator
    # only allows the creator of the route to make edits/destroy
    return head(:forbidden) unless @route.creator == current_user
  end

end
