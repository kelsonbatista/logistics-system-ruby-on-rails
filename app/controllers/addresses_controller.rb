class AddressesController < ApplicationController
  def new
    @order = Order.find(params[:order_id])
    @address = Address.new
    @address_count = @order.addresses.count
  end

  def create
    @order = Order.find(params[:order_id])
    @address = Address.new(address_params)
    @address_count = @order.addresses.count
    if @address.save
      @order.update(status: 'pending') if (@order.products.count > 0 && @order.addresses.count > 0)
      OrderAddress.create(order_id: @order.id, address_id: @address.id)
      if @address_count == 0
        return redirect_to new_order_address_path(order_id: @order.id)
      else
        return redirect_to new_order_product_path(order_id: @order.id)
      end
    end
    flash.now[:alert] = "Erro ao registrar endereço!"
    render :new, status: :unprocessable_entity
  end

  private

  def address_params
    params.require(:address).permit(:person, :address_one, :address_two, :city, :state, :zip)
  end

  def address_find
    @address = Address.find(params[:id])
  end
end
