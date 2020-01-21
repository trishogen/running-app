class RoutesController < ApplicationController
  include RoutesHelper

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
    @user = current_user
    @route = Route.find(params[:id])
  end

  def edit
    @route = Route.find(params[:id])
    forbid_if_user_hasnt_been_on_route(@route)
  end

  def update
    @route = Route.find(params[:id])

    forbid_if_user_hasnt_been_on_route(@route)

    @route.update(route_params)

    if @route.save
      redirect_to route_path(@route)
    else
      render :edit
    end
  end

  def destroy
    @route = Route.find(params[:id])
    forbid_if_user_hasnt_been_on_route(@route)

    @route.destroy
    redirect_to routes_path
  end

  private

  def route_params
    params.require(:route).permit(:title, :location, :distance, :elevation,
      :description, :condition)
  end

end
