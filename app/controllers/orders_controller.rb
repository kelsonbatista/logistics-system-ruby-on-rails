class OrdersController < ApplicationController
  before_action :order_find, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all

    @order_products_pending = Order.joins(:products).group(:order_id).select("orders.*, count(products.id) as total_products, sum(products.weight) as total_weight").where(status: 'pending')

    @order_products_sent = Order.joins(:products).group(:order_id).select("orders.*, count(products.id) as total_products, sum(products.weight) as total_weight").where(status: 'sent')

    @order_products_delivered = Order.joins(:products).group(:order_id).select("orders.*, count(products.id) as total_products, sum(products.weight) as total_weight").where(status: 'delivered')

    @order_products_canceled = Order.joins(:products).group(:order_id).select("orders.*, count(products.id) as total_products, sum(products.weight) as total_weight").where(status: 'canceled')

    @order_products_returned = Order.joins(:products).group(:order_id).select("orders.*, count(products.id) as total_products, sum(products.weight) as total_weight").where(status: 'returned')
  end

  def show
    @products_weight = Product.joins(:orders).where(orders: {id: @order.id}).sum(:weight)
    @products = @order.products
    @recipient_addresses = @order.addresses.where(person: 'recipient')
    @sender_addresses = @order.addresses.where(person: 'sender')

    @modes = Mode.all
    @prices = Price.all
    @deadlines = Deadline.all

    @modes_prices_deadlines = @modes.joins(:prices).joins(:deadlines).select("modes.name, modes.min_distance, modes.max_distance, modes.min_weight, modes.max_weight, prices.min_weight, prices.max_weight, prices.price_per_km, deadlines.min_distance, deadlines.max_distance, deadlines.deadline").where('modes.min_weight <= ?', @products_weight).where('modes.max_weight >= ?', @products_weight).where('prices.min_weight <= ?', @products_weight).where('prices.max_weight >= ?', @products_weight).where('deadlines.min_distance <= ?', @order.distance).where('deadlines.max_distance >= ?', @order.distance).where(active: true)
  end

  def new
    @order = Order.new
    @order.addresses.build
    @order.products.build
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      return redirect_to new_order_address_path(order_id: @order.id)
    end
    flash.now[:alert] = "Erro ao registrar ordem de entrega!"
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