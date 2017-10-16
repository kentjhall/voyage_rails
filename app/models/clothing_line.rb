class ClothingLine < ApplicationRecord
  
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :items

  validates_presence_of :name
  validates_presence_of :index

end
