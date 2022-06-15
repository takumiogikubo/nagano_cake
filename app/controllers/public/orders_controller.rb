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
    @order=current_customer.orders.new(order_params)
    @order.save
      @cart_items = current_customer.cart_items.all
        @cart_items.each do |cart_item|
          @order_detail = @order.order_details.new
          @order_detail.item_id = cart_item.item.id
          @order_detail.price = cart_item.item.price
          @order_detail.amount = cart_item.amount
          @order_detail.save
          current_customer.cart_items.destroy_all
      end
    redirect_to complete_orders_path
  end

  def index
    @orders = Order.all
    # @cart_items = CartItem.all
    @order_details = OrderDetail.all
  end

  def show
    @order=Order.find(params[:id])
    # @cart_items=current_customer.cart_items.all
    @order_details = OrderDetail.where(order_id: params[:id])
  end

  private
  def order_params
    params.require(:order).permit(:customer_id,:total_payment,:shipping_cost,:payment_method,:postal_code,:address,:name,:status)
  end
end
