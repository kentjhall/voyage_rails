class ItemsController < ApplicationController
  require "stripe"

  def show
    @item = Item.find(params[:id])
    @product = Stripe::Product.retrieve(@item.product_id)
    @clothing_line = @item.clothing_line

    @img_paths = []
    if @item.num_imgs > 0
      for i in 1..@item.num_imgs
        @img_paths << "#{@item.img_path}/#{i}"
      end
    end

    # check that item name and retrieved product name match
    if @product.name.downcase != @item.name.downcase
      return error
    end

    # check that retrieved product has an sku
    if @product.skus.data.empty?
      return error
    end

    # check that item price and retrieved sku prices match
    @product.skus.data.each do |sku|
      if sku.price/100 != @item.price
        return error
      end
    end

    @back_arrow_info = { :name => @clothing_line.name, :link => flash_exec_path(:exec => "scroll_to_store", :url => clothing_line_path(@clothing_line)) }
  end

  private

  def error
    flash[:error] = "Sorry, there is a technical problem with displaying this item.  Voyage team has been notified."
    redirect_to(clothing_line_path(@clothing_line))
  end

end
