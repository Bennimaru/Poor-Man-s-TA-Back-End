class LocationsController < ApplicationController
  def index
    @locations = Location.all
    render json: @locations
  end

  def show
    @location = Location.find(params[:id])
    render json: @location
  end

  def create
    @location = Location.create(location_params)
    render json: @location
  end

  def edit
    @location = Location.find(params[:id])
    @location.update(location_params)
    render json: @location
  end

  private
  def location_params
  params.permit(:name, :image, :address, :description, :borough_id)
  end

end
