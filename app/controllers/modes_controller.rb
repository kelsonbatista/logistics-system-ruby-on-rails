class ModesController < ApplicationController
  before_action :mode_find, only: [:show] 

  def index
    @modes = Mode.all
  end

  def show
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

  private

  def mode_params
    params.require(:mode).permit(:name, :min_distance, :max_distance, :min_weight, :max_weight, :fixed_fee, :active)
  end

  def mode_find
    @mode = Mode.find(params[:id])
  end
end
