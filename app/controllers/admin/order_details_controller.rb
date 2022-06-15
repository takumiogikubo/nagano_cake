class Admin::OrderDetailsController < ApplicationController

  def update

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
