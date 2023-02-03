class HomeController < ApplicationController
  def index
    @home = root_path ? true : false
    @login = request.path == root_path ? true : false

    @orders = Order.all
    @month = Date.today.strftime("%b")

    @pending_order = Order.where(status: "pending").where('updated_at > ?', 30.days.ago).count
    @sent_order = Order.where(status: "sent").where('updated_at > ?', 30.days.ago).count
    @delivered_order = Order.where(status: "delivered").where('updated_at > ?', 30.days.ago).count
    @canceled_order = Order.where(status: "canceled").where('updated_at > ?', 30.days.ago).count
    @returned_order = Order.where(status: "returned").where('updated_at > ?', 30.days.ago).count
    @efficiency = ((@delivered_order.to_f / (@delivered_order + @sent_order).to_f) * 100).to_i
  
    @on_time = Order.where(condition: "on_time").where('updated_at > ?', 30.days.ago).count
    @late = Order.where(condition: "late").where('updated_at > ?', 30.days.ago).count
    @effectiveness = ((@on_time.to_f / (@on_time + @late).to_f) * 100).to_i
    
    @alert_efficiency = @efficiency >= 75 ? 'green' : @efficiency <= 50 ? 'red' : 'yellow'
    @alert_effectiveness = @effectiveness >= 75 ? 'green' : @effectiveness <= 50 ? 'red' : 'yellow'

    @revenue = "%.1f" % Budget.all.where(created_at: Date.today.all_month).sum(:total)
    @revenue = "%.1f" % (@revenue.to_i/1000).to_s << 'K' if @revenue.to_s.to_i >= 1000

    @orders_all = @sent_order + @delivered_order + @canceled_order + @returned_order

    respond_to do |format|
      format.html {  }
    end
  end
end