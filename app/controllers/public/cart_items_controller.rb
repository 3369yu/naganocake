class Public::CartItemsController < ApplicationController
  before_action :authenticate_customer!
  
  def index
    @cart_items = current_customer.cart_items.all
  end
  
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.item_id = cart_item_params[:item_id]
    @cart_items = current_customer.cart_items.all
      if current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
        cart_item = current_customer.cart_items.find_by(item_id: params[:cart_item][:item_id])
        cart_item.amount += params[:cart_item][:amount].to_i
        cart_item.update(amount: cart_item.amount)
        cart_item.save
        redirect_to cart_items_path, notice:"カートに商品が入りました"
      elsif @cart_item.save
            redirect_to cart_items_path, notice:"カートに商品が入りました"
      end
  end

  def update
    cart_item = CartItem.find(params[:id])
    cart_item.update(cart_item_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  def destroy_all
    cart_item = CartItem.all
    cart_item.destroy_all
    redirect_to cart_items_path
  end

  
  def subtotal
    item.with_tax_price * amount
  end


  private

  def cart_item_params
    params.require(:cart_item).permit(:item_id, :customer_id, :amount, :image)
  end

end
