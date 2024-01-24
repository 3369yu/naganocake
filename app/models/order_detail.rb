class OrderDetail < ApplicationRecord
  
  belongs_to :order
  belongs_to :item
  
  has_one_attached :image
end
