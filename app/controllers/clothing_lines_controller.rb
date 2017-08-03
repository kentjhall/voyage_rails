class ClothingLinesController < ApplicationController

  def show
    @clothing_line = ClothingLine.find(params[:id])
    if !@clothing_line.available
      redirect_to "/home"
    end
  end

end
