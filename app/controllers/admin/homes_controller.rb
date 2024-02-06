class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    if params[:customer_id]
      @customer_id = params[:customer_id]
      @customer = Customer.find(params[:customer_id])
      @order = Order.where(customer_id: @customer_id)
      @order = @order.page(params[:page]).per(10)
    else
      @order = Order.page(params[:page]).per(10)
    end
  end


  private

  def order_params
     params.require(:order).permit(:customer_id, :postal_code, :address, :name, :total_payment, :postage, :payment_method, :image)
  end

  def order_detail_params
     params.require(:order_detail).permit(:order_id, :item_id, :price, :quanity)
  end

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email, :password, :active)
  end

end
