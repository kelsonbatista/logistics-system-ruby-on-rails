class VehiclesController < ApplicationController
  before_action :find_vehicle, only: [:show, :edit, :update, :destroy]

  def index
    @vehicles = Vehicle.all
  end

  def show
  end

  private

  def find_vehicle
    @vehicle = Vehicle.find(params[:id])
  end
end
