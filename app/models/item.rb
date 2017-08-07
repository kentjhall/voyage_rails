class Item < ApplicationRecord

  belongs_to :clothing_line

  validates_presence_of :product_id
  validates_presence_of :name
  validates_presence_of :price
  validates_presence_of :img_path
  validates_presence_of :num_imgs

end
