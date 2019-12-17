class RoutesController < ApplicationController
  before_action :require_login

  def index
    @routes = Route.all
  end

  def new
    @route = Route.new
  end

  def create
    @route = Route.new(route_params)
    if @route.save
      redirect_to route_path(@route)
    else
      render :new
    end
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

  def destroy
    Route.find(params[:id]).destroy
    redirect_to routes_path
  end

  private

  def route_params
    params.require(:route).permit(:title, :location, :distance, :elevation)
  end

end
