class Admin::HomesController < ApplicationController
  before_action :authenticate_admin!

  def top
    @order = Order.page(params[:page]).per(10)
  end
  
end
