class ClothingLinesController < ApplicationController

  def show
    @clothing_line = ClothingLine.find(params[:id])
    if !@clothing_line.available
      redirect_to "/home"
    end
    @back_arrow_info = { :name => "store", :link => flash_exec_path(:exec => "scroll_to_store", :url => "/home") }
  end

end
