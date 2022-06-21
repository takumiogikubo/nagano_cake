class Admin::HomesController < ApplicationController
  def top
    @orders = Order.all.page(params[:page]).per(10)
    # @cart_items = CartItem.all
    @order_details = OrderDetail.all
  end
end
