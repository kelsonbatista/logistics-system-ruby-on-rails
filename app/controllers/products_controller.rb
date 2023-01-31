class ProductsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @product = Product.new
  end

  def create
    @order = Order.find(params[:order_id])
    @product = Product.new(product_params)
    if @product.save
      @order.update(status: 'pending') if @order.addresses.count > 0
      flash[:notice] = "Ordem de entrega registrada com sucesso!" if @order.addresses.count > 0
      OrderProduct.create(order_id: @order.id, product_id: @product.id)
      return redirect_to order_path(@order.id)
    end
    flash.now[:alert] = "Erro ao registrar produto!"
    render :new, status: :unprocessable_entity
  end

  def product_params
    params.require(:product).permit(:code, :width, :height, :depth, :weight)
  end

  def product_find
    @product = Product.find(params[:id])
  end
end
