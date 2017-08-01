class ChargesController < ApplicationController

  before_action :check_quantities_new_charge, :only => [:new]
  before_action :check_quantities_create_charge, :only => [:create]

  def new
  end

  def create
    items = []
    session[:order_items].each do |order_item|
      items << { :type => 'sku', :parent => order_item['sku_id'], :quantity => order_item['quantity'] }
    end

    order = Stripe::Order.create(
      :currency => 'usd',
      :items => items,
      :email => params[:stripeEmail],
      :shipping => {
        :name => params[:stripeShippingName],
        :address => {
          :line1 => params[:stripeShippingAddressLine1],
          :city => params[:stripeShippingAddressCity],
          :state => params[:stripeShippingAddressState],
          :country => params[:stripeShippingAddressCountry],
          :postal_code => params[:stripeShippingAddressZip]
        }
      }
    )

    order.pay(
      :source  => params[:stripeToken]
    )

    @amount = order.amount

    session[:order_items] = nil

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to checkout_path
    end
  end

  private

  def check_quantities_new_charge
    unavailable_quantity_items = []

    session[:order_items].each_with_index do |order_item, i|
      sku = Stripe::SKU.retrieve(order_item['sku_id'])

      unless sku.inventory.quantity.nil?
      quantity_available = sku.inventory.quantity.to_i
        if order_item['quantity'].to_i > quantity_available
          if quantity_available == 0
            session[:order_items].delete_at(i)
          else
            order_item['quantity'] = quantity_available
          end
          unavailable_quantity_items << "#{order_item['name']} #{order_item['size'].upcase}"
        end
      end
    end

    if !unavailable_quantity_items.empty?
      error_message = ""
      if unavailable_quantity_items.length == 1
        error_message = new_singular_error
      else
        error_message = new_plural_error
      end
      unavailable_quantity_items.each_with_index do |item_info, i|
        error_message += " " + item_info
        if i < unavailable_quantity_items.length-1
          error_message += ","
        end
      end
      flash[:error] = error_message
      redirect_to checkout_path
    end
  end

  def check_quantities_create_charge
    unavailable_quantity_items = []

    session[:order_items].each_with_index do |order_item, i|
      sku = Stripe::SKU.retrieve(order_item['sku_id'])

      unless sku.inventory.quantity.nil?
      quantity_available = sku.inventory.quantity.to_i
        if order_item['quantity'].to_i > quantity_available
          if quantity_available == 0
            session[:order_items].delete_at(i)
          else
            order_item['quantity'] = quantity_available
          end
          unavailable_quantity_items << "#{order_item['name']} #{order_item['size'].upcase}"
        end
      end
    end

    if !unavailable_quantity_items.empty?
      error_message = ""
      if unavailable_quantity_items.length == 1
        error_message = create_singular_error
      else
        error_message = create_plural_error
      end
      unavailable_quantity_items.each_with_index do |item_info, i|
        error_message += " " + item_info
        if i < unavailable_quantity_items.length-1
          error_message += ","
        end
      end
      flash[:error] = error_message
      redirect_to checkout_path
    end
  end

  def new_singular_error
    "Order adjusted due to quantity issue.  The requested quantity for the following item is no longer available, and has been adjusted in cart:"
  end

  def new_plural_error
    "Order adjusted due to quantity issue.  The requested quantities for the following items are no longer available, and have been adjusted in cart:"
  end

  def create_singular_error
    "Order canceled due to quantity issue.  Your card was not charged.  If paid in Bitcoin, you should receive a refund email within a day.  Please contact support with any questions.  The requested quantity for the following item is no longer available, and has been adjusted in cart:"
  end

  def create_plural_error
    "Order canceled due to quantity issue.  Your card was not charged.  If paid in Bitcoin, you should receive a refund email within a day.  Please contact support with any questions.  The requested quantities for the following items is are longer available, and have been adjusted in cart:"
  end
