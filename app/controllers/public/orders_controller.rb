class Public::OrdersController < ApplicationController
  def new
    @order=Order.new
  end

  def comfirm
    @order=Order.new(order_params)
    @order.postal_code=current_customer.postal_code
    @order.address=current_customer.address
    @order.name=current_customer.first_name + current_customer.last_name
    binding.pry
  end

  def complete
  end

  def create
  end

  def index
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:payment_method,:postal_code,:address,:name)
  end
end
