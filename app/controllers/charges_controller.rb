class ChargesController < ApplicationController

  before_action only: [:new] do
    check_quantities(false)
  end
  before_action only: [:create] do
    check_quantities(true)
  end

  def new
    if session["order_items"].empty?
      return redirect_to "/home"
    end

    @back_arrow_info = { :name => "cart", :link => flash_exec_path(:exec => "scroll_to_cart", :url => URI((!request.referer.nil? && !request.referer.include?("team_members")) ? request.referer : '/home').path) }
  end

  def create
    items = []
    session[:order_items].each do |order_item|
      items << { :type => 'sku', :parent => order_item['sku_id'], :quantity => order_item['quantity'] }
    end

    if items.empty?
      return redirect_to "/home"
    end

    customer = Stripe::Customer.create(
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
      },
      :source => params[:stripeToken]
    )

    order = Stripe::Order.create(
      :currency => 'usd',
      :items => items,
      :customer => customer.id
    )

    order.pay(
      :customer  => customer.id
    )

    customer.delete

    @order_id = order.id
    @amount = order.amount

    @back_arrow_info = { :name => "home", :link => '/home' }

    session[:order_items] = nil

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to checkout_path
    end
  end

  private

  def check_quantities(order_created)
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
          item_listing = "'#{order_item['name']} #{order_item['size'].upcase}'"
          if i > 0 && i == session[:order_items].length-1
            item_listing.prepend("and ")
          end
          unavailable_quantity_items << item_listing
        end
      end
    end

    if !unavailable_quantity_items.empty?
      error_message_lines = ["", ""]

      error_message_lines[0] = "#{quantity_error_beg(order_created)}  #{order_cancel_error}" if order_created
      error_message_lines[1] = quantity_error_end(unavailable_quantity_items)

      if order_created
        flash[:order_error_line1] = error_message_lines[0]
        flash[:order_error_line2] = error_message_lines[1]
      else
        flash[:error] = error_message_lines[1]
      end

      redirect_to checkout_path
    end
  end

  def quantity_error_beg
    "Order canceled due to quantity issue."
  end

  def quantity_error_end(unavailable_quantity_items)
    if unavailable_quantity_items.length == 1
      "The requested quantity for #{unavailable_quantity_items[0]} is no longer available, and has been adjusted in cart."
    elsif unavailable_quantity_items.length > 1
      uq_items_list = unavailable_quantity_items.length > 2 ? unavailable_quantity_items.join(", ") : unavailable_quantity_items.join(" ")
      "The requested quantities for #{uq_items_list} are no longer available, and have been adjusted in cart."
    end
  end

  def order_cancel_error
    "Your card was not charged.  If paid in Bitcoin, you will receive a refund email within a few days.  Please contact support with any questions."
  end
