class VehiclesController < ApplicationController
  before_action :find_vehicle, only: [:show, :edit, :update, :destroy]

  def index
    @vehicles = Vehicle.all
  end

  def show
  end

  def new
    @vehicle = Vehicle.new
    @modes = Mode.all.order(:name)
  end

  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      flash[:notice] = "Veículo criado com sucesso"
      return redirect_to vehicles_path
    end
    @modes = Mode.all.order(:name)
    flash.now[:alert] = "Erro ao criar o veículo"
    render :new, status: :unprocessable_entity
  end

  def edit
    @modes = Mode.all.order(:name)
  end

  def update
    if @vehicle.update(vehicle_params)
      flash[:notice] = "Veículo atualizado com sucesso"
      return redirect_to @vehicle
    end
    @modes = Mode.all.order(:name)
    flash.now[:alert] = "Erro ao atualizar o veículo"
    render :edit, status: :unprocessable_entity
  end

  private

  def vehicle_params
    params.require(:vehicle).permit(:mode_id, :plate, :brand, :model, :category, :year, :capacity, :status)
  end

  def find_vehicle
    @vehicle = Vehicle.find(params[:id])
  end
end
