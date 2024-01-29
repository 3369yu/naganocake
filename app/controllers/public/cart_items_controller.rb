class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!

  def index
    @cart_items = current_customer.cart_items.all
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
  end

  def destroy_all
  end

  def create
    @cart_item = CartItems.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_items = current_customer.cart_items.all
      @cart_items.each do |cart_item|
      if cart_item.item_id == @cart_item.item.id
        new_amount = cart_item.amount + @cart_item.amount
        cart_item.update_attribute(:amount, new_amount)
        @cart_item.delete
        redirect_to cart_items_path
      elsif @cart_item.save
            redirect_to cart_items_path,notice:"カートに商品が入りました"
      end
    end
  end
  
  def subtotal
    item.with_tax_price * amount
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount, :image)
  end

end
