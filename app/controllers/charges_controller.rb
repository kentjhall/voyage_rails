class ChargesController < ApplicationController

  def new
    @amount = 0
    session[:order_items].each do |order_item|
      @amount += order_item['price'].to_i * order_item['quantity'].to_i
    end
  end

  def create
    customer = Stripe::Customer.create(
      :email => params[:stripeEmail],
      :source  => params[:stripeToken],
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

    items = []
    session[:order_items].each do |order_item|
      items << { :type => 'sku', :parent => order_item['sku_id'], :quantity => order_item['quantity'] }
    end

    order = Stripe::Order.create(
      :currency => 'usd',
      :items => items,
      :customer => customer.id
    )

    order.pay(
      :customer => customer.id
    )

    @amount = order.amount

    session[:order_items] = nil

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to checkout_path
    end

  end
