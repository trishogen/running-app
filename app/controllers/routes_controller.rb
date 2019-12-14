class RoutesController < ApplicationController

  def new
    @route = Route.new
  end

  def create
    @route = Route.create(route_params)
    redirect_to route_path(@route)
  end

  private

  def route_params
    params.require(:route).permit(:title, :location, :distance, :elevation)
  end
end
