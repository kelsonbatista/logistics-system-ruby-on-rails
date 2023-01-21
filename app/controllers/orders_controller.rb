class OrdersController < ApplicationController
  def index
    @orders = Order.all 
    @order_products = Order.joins(:products).group(:order_id).select("orders.*, count(products.id) as total_products, sum(products.weight) as total_weight")
  end
end
