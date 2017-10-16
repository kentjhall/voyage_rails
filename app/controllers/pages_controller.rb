class PagesController < ApplicationController

  layout :resolve_layout

  # before_action :check_for_mobile

  def home
    @clothing_lines = ClothingLine.all

    @meta_description = 'Voyage clothing and apparel'
  end

  def art
  end

  def about_us
  end

  def journal
  end

  def contact
  end

  private

  def resolve_layout
    case action_name
    when "myst"
      "no_layout"
    else
      "application"
    end
  end

end
