class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @order = Order.page(params[:page]).per(10)
  end
  
  
  private
  
  def order_detail_params
     params.require(:order_detail).permit(:order_id, :item_id, :price, :quanity)
  end
  
end
