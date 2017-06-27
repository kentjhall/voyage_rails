class ClothingLinesController < ApplicationController

  def index
    @clothing_lines = ClothingLine.all
  end

  def show
    @clothing_line = ClothingLine.find(params[:id])
    if !@clothing_line.available
      redirect_to(store_path)
    end
  end

end
