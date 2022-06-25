class Admin::OrdersController < ApplicationController
  def show
    @order=Order.find(params[:id])
    @order_details = @order.order_details
  end

  def update
    @order=Order.find(params[:id])
    @order.update(order_params)
    if @order.status == "confirmation"
      @order.order_details.update(making_status: 1)
    end
    redirect_back fallback_location: { action: "show", id: :id }

  end


  def order_params
    params.require(:order).permit(:status)
  end

end
