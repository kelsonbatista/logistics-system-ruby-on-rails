class ProductsController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @product = Product.new
    @product_count = @order.products.count
  end

  def create
    @order = Order.find(params[:order_id])
    @product = Product.new(product_params)
    # @product_count = @order.addresses.count
    if @product.save
      # flash[:notice] = "Endereço registrado com sucesso!"
      # if (@product_count == 0 || @product_count == 1)
        flash[:notice] = "Produto registrado com sucesso!"
        # return redirect_to new_order_product_path(order_id: @order.id)
        return redirect_to order_path(@order.id)
      # else
      #   flash[:notice] = "contagem 2"
      #   return redirect_to order_path(order_id: @order.id)
      # end
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
