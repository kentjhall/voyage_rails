class ClothingLine < ApplicationRecord

  has_many :items

  validates_presence_of :name
  validates_presence_of :index

end
