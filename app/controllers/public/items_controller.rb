class Public::ItemsController < ApplicationController
  def index
    @genres=Genre.all
    @item=Item.find_by(genre_id: params[:genre_id])
    @items=Item.where(genre_id: params[:genre_id]).page(params[:page])

  end

  def show
    @genres=Genre.all
    @item=Item.find(params[:id])
  end
end
