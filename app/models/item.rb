class Item < ApplicationRecord
  
  has_many :cart_item
  belongs_to :genre
  
  has_one_attached :image
end
