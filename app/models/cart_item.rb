class CartItem < ApplicationRecord
  
  has_many :order_detail
  belongs_to :customer
  belongs_to :item
  
  def subtotal
    item.with_tax_price * amount
  end
  
end
