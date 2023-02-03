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
    @mode = Mode.find(@budget.mode)
    @budget.mode = @mode.name

    @products_weight = Product.joins(:orders).where(orders: {id: @order.id}).sum(:weight)
    @modes = Mode.all
    @prices = Price.all
    @deadlines = Deadline.all

    @modes_prices_deadlines = @modes.joins(:prices).joins(:deadlines).select("modes.id, modes.name, modes.min_distance, modes.max_distance, modes.min_weight, modes.max_weight, modes.fixed_fee, prices.min_weight, prices.max_weight, prices.price_per_km, deadlines.min_distance, deadlines.max_distance, deadlines.deadline").where('modes.min_weight <= ?', @products_weight).where('modes.max_weight >= ?', @products_weight).where('prices.min_weight <= ?', @products_weight).where('prices.max_weight >= ?', @products_weight).where('deadlines.min_distance <= ?', @order.distance).where('deadlines.max_distance >= ?', @order.distance).where(active: true)

    @vehicles = Vehicle.all
    @vehicle = @vehicles.where(mode_id: @mode.id).where(status: 'operational').first
    
    if !@vehicle
      flash.now[:alert] = "Não há veículos disponíveis para esta modalidade"
      return render :new, status: :unprocessable_entity
    end
    @budget.vehicle_id = @vehicle.id
    
    if @budget.save && @vehicle
      @vehicle.transit!
      @order.sent!
      @order.update(tracking_code: SecureRandom.uuid)
      return redirect_to order_confirmed_path(@order.id)
    end
    flash.now[:alert] = "Erro ao selecionar modalidade"
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
    params.fetch(:budget, {}).permit(:id, :mode, :total, :price_km, :fixed_fee, :deadline, :order_id, :vehicle_id)
  end

  def budget_find
    @budget = Budget.find(params[:id])
  end

end
