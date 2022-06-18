class Public::HomesController < ApplicationController
  def top
    @genres=Genre.all

    if params[:genre_id]
      @items=Item.where(genre_id: params[:genre_id]).page(params[:page])
    else
      # @items=Item.all.page(params[:page])
      @items = Item.order('id DESC').limit(4)
      # .page(params[:page]).per(4)
    end
  end

  def about
  end
end
