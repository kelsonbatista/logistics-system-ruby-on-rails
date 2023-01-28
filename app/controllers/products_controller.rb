class ProductsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @product = Product.new
  end

  def create
    @order = Order.find(params[:order_id])
    @product = Product.new(address_params)
    if @product.save
      flash[:notice] = "Produto(s) registrado com sucesso!"
      return redirect_to new_order_product_path(order_id: @order.id)
    end
    flash.now[:alert] = "Erro ao registrar o(s) produto(s)!"
    render :new, status: :unprocessable_entity
  end

  private

  def address_params
    params.require(:product).permit(:person, :address_one, :address_two, :city, :state, :zip)
  end

  def address_find
    @product = Product.find(params[:id])
  end
end
