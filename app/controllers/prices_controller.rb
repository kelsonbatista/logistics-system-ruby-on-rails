class PricesController < ApplicationController
  before_action :find_price, only: [:edit, :update, :destroy]

  def index
    @prices = Price.all
  end

  def destroy
    if @price.destroy
      flash[:notice] = "Preço excluído com sucesso"
      return redirect_to prices_path
    end
    flash.now[:alert] = "Erro ao excluir o preço"
    render :index, status: :unprocessable_entity
  end

  def new
    @price = Price.new
    @modes = Mode.all.order(:name)
  end

  def create
    @price = Price.new(price_params)
    if @price.save
      flash[:notice] = 'Preço cadastrado com sucesso'
      return redirect_to prices_path
    end
    @modes = Mode.all.order(:name)
    flash.now[:alert] = 'Erro ao cadastrar preço'
    render :new, status: :unprocessable_entity
  end

  def edit
    @modes = Mode.all.order(:name)
  end

  def update
    if @price.update(price_params)
      flash[:notice] = "Preço atualizado com sucesso"
      return redirect_to prices_path
    end
    @modes = Mode.all.order(:name)
    flash.now[:alert] = "Erro ao atualizar o preço"
    render :edit, status: :unprocessable_entity
  end

  private

  def price_params
    params.require(:price).permit(:min_weight, :max_weight, :price_per_km, :mode_id)
  end

  def find_price
    @price = Price.find(params[:id])
  end

end
