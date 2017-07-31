class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  http_basic_authenticate_with :name => ENV['DEV_USER'], :password => ENV['DEV_PASS'], except: :myst

  before_action :set_cache_headers
  before_action :set_cart

  def check_for_mobile
    session[:mobile_override] = params[:mobile] if params[:mobile]
    prepare_for_mobile if mobile_device?
  end

  def prepare_for_mobile
    prepend_view_path Rails.root + 'app' + 'views_mobile'
  end

  def mobile_device?
    if session[:mobile_override]
      session[:mobile_override] == "1"
    else
      # Season this regexp to taste. I prefer to treat iPad as non-mobile.
      (request.user_agent =~ /Mobile|webOS/) && (request.user_agent !~ /iPad/)
    end
  end

  helper_method :mobile_device?

  def set_cache_headers
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"
  end

  def set_cart
    order_item_properties = [ 'item_id', 'product_id', 'name', 'sku_id', 'price', 'size', 'quantity' ]

    if session[:order_items].nil?
      session[:order_items] = []
    end

    session[:order_items].compact!

    session[:order_items].each do |order_item|
      order_item_properties.each do |property|
        if order_item[property].nil?
          session[:order_items] = []
        end
      end
    end

    @order_items = session[:order_items]
  end

end
