class PricesController < ApplicationController
  def index
    @prices = Price.all
  end

  def new
    @price = Price.new
    @modes = Mode.all
  end

  def create
    @price = Price.new(price_params)
    if @price.save
      flash[:notice] = 'Preço cadastrado com sucesso'
      return redirect_to prices_path
    end
    @modes = Mode.all
    flash.now[:alert] = 'Erro ao cadastrar preço'
    render :new, status: :unprocessable_entity
  end

  private

  def price_params
    params.require(:price).permit(:min_weight, :max_weight, :price_per_km, :mode_id)
  end

end
