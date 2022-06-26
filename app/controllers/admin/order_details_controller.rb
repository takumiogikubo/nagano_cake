class Admin::OrderDetailsController < ApplicationController

  def update
    @order_detail=OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)

    if @order_detail.making_status == "work"
      Order.update(status: 2)
    end

    if OrderDetail.all.making_statuses == "complete_work"
      Order.update(status: 3)
    end

    redirect_back fallback_location: { action: "show", id: :id }
  end

  # def create
  #   @order_detail=OrderDetail.new(order_detail_params)
  #   @order_detail.save
  #   redirect_to comfirm_orders_path
  # end

private
  def order_detail_params
    params.require(:order_detail).permit(:item_id,:price,:making_status,:amount,:name)
  end

end
