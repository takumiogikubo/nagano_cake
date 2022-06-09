class Public::CartItemsController < ApplicationController

  def index
    @cart_items=current_customer.cart_items.all
    # @items=I/tem.all
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_to cart_items_path
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
  end

  def create
    @cart_item=current_customer.cart_items.new(cart_item_params)
    @cart_item.save
    redirect_to cart_items_path

    # @item = Item.find(cart_item_params[:item_id])
    # @item.save
    # redirect_to cart_items_path
  end

  private
  def cart_item_params
    params.require(:cart_item).permit(:item_id,:amount)
  end

end
