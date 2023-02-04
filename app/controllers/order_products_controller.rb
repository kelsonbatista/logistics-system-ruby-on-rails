class OrderProductsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @product = Product.new
    @order.products.build
    # @product = Product.new
  end

  def create
    @order = Order.find(params[:order_id])
    # @product = @order.products.build(address_params)
    @product = Product.new(address_params)
    if @product.save
      flash[:notice] = "Produto(s) registrado com sucesso!"
      return redirect_to orders_path(@order.id)
    end
    flash.now[:alert] = "Erro ao registrar o(s) produto(s)!"
    render :new, status: :unprocessable_entity
  end

  private

  def address_params
    params.require(:product).permit(order_products_attributes: [:id, :order_id, :product_id, :_destroy,
      products_attributes: [:id, :code, :width, :height, :depth, :weight, :_destroy]])
  end

  def address_find
    @product = Product.find(params[:id])
  end
end
