class ItemsController < ApplicationController

  def show
    @item = Item.find(params[:id])
    @clothing_line = ClothingLine.find(@item.clothing_line_id)
  end

end
