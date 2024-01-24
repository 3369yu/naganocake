class Order < ApplicationRecord
  
  has_many :order_detail
  belongs_to :customer
  has_one_attached :image
end
