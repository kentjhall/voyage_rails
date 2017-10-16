class ClothingLinesController < ApplicationController

  def show
    @clothing_line = ClothingLine.friendly.find(params[:id])
    if !@clothing_line.available
      redirect_to "/home"
    end
    @back_arrow_info = { :name => "store", :link => flash_exec_path(:exec => "scroll_to_store", :url => "/home") }

    @meta_title = meta_title @clothing_line.name
    @meta_description = "Voyage clothing line – #{@clothing_line.name}"
  end

end
