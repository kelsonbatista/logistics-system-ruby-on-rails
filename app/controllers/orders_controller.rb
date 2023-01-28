class OrdersController < ApplicationController
  before_action :order_find, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all 
    @products = Order.joins(:products).group(:order_id).select("orders.*, count(products.id) as total_products, sum(products.weight) as total_weight")
  end

  def show
  end

  def new
    @order = Order.new
    @order.addresses.build
    # @order_products = @order.order_products.build
    @order.products.build
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      # flash[:notice] = "Pedido registrado com sucesso!"
      return redirect_to new_order_address_path(order_id: @order.id)
    end
    flash.now[:alert] = "Erro ao registrar pedido!"
    render :new, status: :unprocessable_entity
  end

  private

  def order_params
    params.require(:order).permit(:code, :distance, :status, 
      addresses_attributes: [:id, :person, :address_one, :address_two, :city, :state, :zip, :_destroy],
      order_products_attributes: [:id, :order_id, :product_id, :_destroy,
      products_attributes: [:id, :code, :width, :height, :depth, :weight, :_destroy]])
  end
  
  def order_find
    @order = Order.find(params[:id])
  end

end