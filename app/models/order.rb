class Order < ApplicationRecord
  
  has_many :order_detail
  belongs_to :customer
  has_one_attached :image
  
  enum payment_method: { credit_card: 0, transfer: 1 }
  
  def total_payment
    cart_item.sum { |cart_item| cart_item.subtotal } + postage
  end
  
end
