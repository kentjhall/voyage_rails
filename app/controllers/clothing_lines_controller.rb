class ClothingLinesController < ApplicationController

  def show
    @clothing_line = ClothingLine.find(params[:id])
  end

end
