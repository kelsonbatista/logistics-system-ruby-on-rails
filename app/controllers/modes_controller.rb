class ModesController < ApplicationController
  before_action :mode_find, only: [:show, :edit, :update, :destroy] 

  def index
    @modes = Mode.all
  end

  def show
    @prices = Price.where(mode_id: @mode.id).order(:min_weight)
    @deadlines = Deadline.where(mode_id: @mode.id).order(:min_distance)
    @in_operation = Vehicle.where(mode_id: @mode.id, status: true).order(:plate)
    @in_maintenance = Vehicle.where(mode_id: @mode.id, status: false).order(:plate)
  end

  def destroy
    if @mode.destroy
      flash[:notice] = "Modalidade apagada com sucesso"
      return redirect_to modes_path
    end
    flash.now[:alert] = "Erro ao apagar a modalidade"
    render :show, status: :unprocessable_entity
  end

  def new
    @mode = Mode.new
  end

  def create
    @mode = Mode.new(mode_params)
    if @mode.save
      flash[:notice] = t("mode_created_sucessfully")
      return redirect_to modes_path
    end
    flash.now[:alert] = t("error_on_creating_mode")
    render :new, status: :unprocessable_entity
  end

  def edit
  end

  def update
    if @mode.update(mode_params)
      flash[:notice] = "Modalidade atualizada com sucesso"
      return redirect_to @mode
    end
    flash.now[:alert] = "Erro ao atualizar a modalidade"
    render :edit, status: :unprocessable_entity
  end

  private

  def mode_params
    params.require(:mode).permit(:name, :min_distance, :max_distance, :min_weight, :max_weight, :fixed_fee, :active)
  end

  def mode_find
    @mode = Mode.find(params[:id])
  end
end
