class BudgetsController < ApplicationController
  before_action :budget_find, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def new
    @order = Order.find(params[:order_id])
    @budget = Budget.new
    @products_weight = Product.joins(:orders).where(orders: {id: @order.id}).sum(:weight)
    @modes = Mode.all
    @prices = Price.all
    @deadlines = Deadline.all

    @modes_prices_deadlines = @modes.joins(:prices).joins(:deadlines).select("modes.id, modes.name, modes.min_distance, modes.max_distance, modes.min_weight, modes.max_weight, modes.fixed_fee, prices.min_weight, prices.max_weight, prices.price_per_km, deadlines.min_distance, deadlines.max_distance, deadlines.deadline").where('modes.min_weight <= ?', @products_weight).where('modes.max_weight >= ?', @products_weight).where('prices.min_weight <= ?', @products_weight).where('prices.max_weight >= ?', @products_weight).where('deadlines.min_distance <= ?', @order.distance).where('deadlines.max_distance >= ?', @order.distance).where(active: true)
  end

  def create
    @order = Order.find(params[:order_id])
    @budget = Budget.new(budget_params)
    @mode_id = params[:budget][:mode]
    @mode = Mode.find(@mode_id)

    @budget.mode = @mode.name
    @budget.total = params[:budget][:total]
    @budget.price_km = params[:budget][:price_km]
    @budget.fixed_fee = params[:budget][:fixed_fee]
    @budget.deadline = params[:budget][:deadline]
    @budget.order_id = params[:budget][:order_id]

    @products_weight = Product.joins(:orders).where(orders: {id: @order.id}).sum(:weight)
    @modes = Mode.all
    @prices = Price.all
    @deadlines = Deadline.all

    @modes_prices_deadlines = @modes.joins(:prices).joins(:deadlines).select("modes.id, modes.name, modes.min_distance, modes.max_distance, modes.min_weight, modes.max_weight, modes.fixed_fee, prices.min_weight, prices.max_weight, prices.price_per_km, deadlines.min_distance, deadlines.max_distance, deadlines.deadline").where('modes.min_weight <= ?', @products_weight).where('modes.max_weight >= ?', @products_weight).where('prices.min_weight <= ?', @products_weight).where('prices.max_weight >= ?', @products_weight).where('deadlines.min_distance <= ?', @order.distance).where('deadlines.max_distance >= ?', @order.distance).where(active: true)

    @vehicle = Vehicle.all
    @vehicle = @vehicle.where(mode_id: @mode_id).where(status: 'operational').first
    
    if @budget.save && @vehicle
      @vehicle.update(status: 'transit')
      @order.update(status: 'sent')
      return redirect_to order_confirmed_path(@order.id)
    end
    flash.now[:alert] = "Não há veículos disponíveis para esta modalidade"
    render :new, status: :unprocessable_entity
  end

  def edit
  end

  def update
    @mode = Mode.find(@budget.mode)
    @vehicle = Vehicle.all
    @vehicle = Vehicle.where(mode_id: @mode.id).where(status: 'operational').first
    
    if @budget.update(budget_params) && @vehicle
      @vehicle.update(status: 'transit')
      flash[:notice] = "Ordem de entrega confirmada!"
      return redirect_to order_confirmed_path(@order)
    end
    flash.now[:alert] = "Não há veículos disponíveis para esta modalidade"
    render :edit, status: :unprocessable_entity
  end

  private

  def budget_params
    params.require(:budget).permit(:mode, :total, :price_km, :fixed_fee, :deadline, :order_id)
  end

  def budget_find
    @budget = Budget.find(params[:id])
  end

end
