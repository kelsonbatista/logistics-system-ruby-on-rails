class OrdersController < ApplicationController
  before_action :order_find, only: [:show, :show_confirmed, :edit, :update, :destroy, :delivered, :canceled, :returned, :reason]

  def index
    @orders = Order.all
    @vehicles = Vehicle.all
    @budgets = Budget.all

    @order_products_open = Order.joins(:products).group(:order_id).select("orders.*, count(products.id) as total_products, sum(products.weight) as total_weight").where(status: 'open')

    @order_products_open_no_product = Order.where.not(id: OrderProduct.select(:order_id))

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
  end

  def show_confirmed
    @products_weight = Product.joins(:orders).where(orders: {id: @order.id}).sum(:weight)
    @products = @order.products
    @recipient_addresses = @order.addresses.where(person: 'recipient')
    @sender_addresses = @order.addresses.where(person: 'sender')
    @budget = Budget.find_by(order_id: params[:id])
  end

  def new
    @order = Order.new
    @order.addresses.build
    @order.products.build
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      @order.update(status: 'pending')
      return redirect_to new_order_address_path(order_id: @order.id)
    end
    flash.now[:alert] = "Erro ao registrar ordem de entrega!"
    render :new, status: :unprocessable_entity
  end

  def edit
  end

  def update
    if @order.update(order_params)
      flash[:notice] = "Ordem de entrega atualizada com sucesso!"
      return redirect_to order_confirmed_path(@order)
    end
    flash.now[:alert] = "Erro ao atualizar a ordem de entrega"
    render :edit, status: :unprocessable_entity
  end

  def delivered
    if @order.delivered!
      @budget = Budget.find_by(order_id: params[:id])
      @vehicle = Vehicle.find_by(id: @budget.vehicle_id)
      @vehicle.operational!
      @order.condition = (@order.updated_at.to_date - @budget.created_at.to_date).to_i <= @budget.deadline.to_i ? 'on_time' : 'late'
      @order.save
      flash[:notice] = "Ordem de entrega marcada como entregue!"
      return redirect_to order_confirmed_path(@order)
    end
    flash.now[:alert] = "Erro ao marcar a ordem de entrega como entregue"
    render :show_confirmed, status: :unprocessable_entity
  end

  def canceled
    if @order.canceled!
      flash[:notice] = "Ordem de entrega marcada como cancelada!"
      return redirect_to order_path(@order)
    end
    flash.now[:alert] = "Erro ao marcar a ordem de entrega como cancelada"
    render :show_confirmed, status: :unprocessable_entity
  end

  def returned
    if @order.returned!
      flash[:notice] = "Ordem de entrega marcada como retornada!"
      return redirect_to order_confirmed_path(@order)
    end
    flash.now[:alert] = "Erro ao marcar a ordem de entrega como retornada"
    render :show, status: :unprocessable_entity
  end

  private

  def order_params
    params.require(:order).permit(:id, :code, :distance, :condition, :reason, :mode, :total, :price_km, :fixed_fee, :deadline, :status, 
      budgets_attributes: [:id, :mode, :total, :price_km, :fixed_fee, :deadline, :order_id, :_destroy],
      addresses_attributes: [:id, :person, :address_one, :address_two, :city, :state, :zip, :_destroy],
      order_products_attributes: [:id, :order_id, :product_id, :_destroy,
      products_attributes: [:id, :code, :width, :height, :depth, :weight, :_destroy]])
  end
  
  def order_find
    @order = Order.find(params[:id])
  end

end