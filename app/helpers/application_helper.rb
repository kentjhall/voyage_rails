module ApplicationHelper

  def error_present
    return flash[:error].present? || (flash[:order_error_line1].present? && flash[:order_error_line2].present?)
  end
  
end
