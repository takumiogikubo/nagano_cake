class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end

  def comfirm
    @order=Order.new(order_params)
    if params[:order][:select_address] == "0"
      @order.postal_code = current_customer.postal_code
      @order.address = current_customer.address
      @order.name = current_customer.last_name + current_customer.first_name
      @order.save
    elsif params[:order][:select_address]== "1"
      @address=Address.find(params[:order][:address_id])
      @order.postal_code=@address.postal_code
      @order.address=@address.address
      @order.name=@address.name
      @order.save
    else
      @order.save
    end
      @cart_items = CartItem.all
      # @orders = Order.all
  end

  def complete
  end

  def create
    @order=Order.new(order_params)
    @order.save
    redirect_to complete_orders_path
  end

  def index
    @orders = Order.all
    @cart_items = CartItem.all
  end

  def show
    @order=Order.find(params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:customer_id,:total_payment,:shipping_cost,:payment_method,:postal_code,:address,:name)
  end
end
