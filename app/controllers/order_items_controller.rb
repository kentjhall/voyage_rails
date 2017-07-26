class OrderItemsController < ApplicationController

  def new
    if session[:order_items].nil?
      session[:order_items] = []
    end

    sku_info = eval(params[:sku_info])

    if !sku_info[:quantity].nil? && !sku_info[:quantity].empty? && params[:quantity] > sku_info[:quantity]
      flash[:error] = "Sorry, insufficient inventory available for the requested item/size"
      return redirect_to(item_path(Item.find(params[:item_id])))
    end

    session[:order_items].each do |order_item|
      if order_item[:sku_id] == sku_info[:id]
      end
    end

    session[:order_items] << { :product_id => params[:product_id], :name => params[:product_name], :sku_id => sku_info[:id], :price => sku_info[:price], :size => sku_info[:size], :quantity => params[:quantity] }
    redirect_to(cart_path)
  end

  def index
    if session[:order_items].nil?
      session[:order_items] = []
    end

    session[:order_items].each do |order_item|
      order_item_properties.each do |property|
        if order_item[property].nil?
          empty_cart
        end
      end
    end

    if params[:empty]
      empty_cart
    end

    @order_items = session[:order_items]
  end

  private

  def empty_cart
    session[:order_items] = nil
  end

  def order_item_properties
    [ 'product_id', 'name', 'sku_id', 'price', 'size', 'quantity' ]
  end

end
