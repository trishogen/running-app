class RoutesController < ApplicationController

  def index
    @routes = Route.all
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.create(route_params)
    redirect_to route_path(@route)
  end

  def show
    @route = Route.find(params[:id])
  end

  def edit
    @route = Route.find(params[:id])
  end

  def update
    @route = Route.find(params[:id])
    @route.update(route_params)
    redirect_to route_path(@route)
  end

  private

  def route_params
    params.require(:route).permit(:title, :location, :distance, :elevation)
  end
end
