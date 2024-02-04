class Order < ApplicationRecord
  
  has_many :order_details
  belongs_to :customer
  has_one_attached :image
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
end
