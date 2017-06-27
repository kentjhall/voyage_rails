class Item < ApplicationRecord

  acts_as_sellable

  belongs_to :clothing_line

  validates_presence_of :name
  validates_presence_of :price

end
