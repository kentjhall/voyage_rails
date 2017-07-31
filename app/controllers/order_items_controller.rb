class OrderItemsController < ApplicationController

  skip_before_action :set_cache_headers

  def add
    if session[:order_items].nil?
      session[:order_items] = []
    end

    sku_info = eval(params[:sku_info])
    already_in_cart = false

    session[:order_items].each do |order_item|
      if order_item['sku_id'] == sku_info[:id]
        already_in_cart = true
        flash.now[:cart_notice] = "item already in cart"
      end
    end

    unless already_in_cart
      if sku_info[:quantity_available].nil? || sku_info[:quantity_available] >= params[:quantity].to_i
        session[:order_items] << { 'item_id' => params[:item_id], 'product_id' => params[:product_id], 'name' => params[:product_name], 'sku_id' => sku_info[:id], 'price' => sku_info[:price], 'size' => sku_info[:size], 'quantity' => params[:quantity] }
      else
        flash.now[:cart_error] = quantity_error_message
      end
    end

    @order_items = session[:order_items]
    respond_to do |format|
      format.js
    end
  end

  def remove
    session[:order_items].delete_at(params[:index].to_i)

    @order_items = session[:order_items]
    respond_to do |format|
      format.js
    end
  end

  def remove_all
    session[:order_items] = []

    @order_items = session[:order_items]
    respond_to do |format|
      format.js
    end
  end

  def update_quantity
    sku = Stripe::SKU.retrieve(session[:order_items][params[:index].to_i]['sku_id'])
    quantity_available = sku.inventory.quantity.to_i

    if quantity_available.nil? || quantity_available >= params[:quantity].to_i
      session[:order_items][params[:index].to_i]['quantity'] = params[:quantity]
    else
      flash.now[:cart_error] = quantity_error_message
    end

    @order_items = session[:order_items]
    respond_to do |format|
      format.js
    end
  end

  private

  def quantity_error_message
    "sorry, we don't have that quantity of the requested item/size available"
  end

end
