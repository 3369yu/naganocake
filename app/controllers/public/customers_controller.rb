class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  
  def show
    @customer = current_customer
  end

  def edit
  end

  def update
  end

  def unsubscribe
   @customer = Customer.find_by(email: params[:customer][:email])
  end

  def withdrawal
    @customer = Customer.find_by(email: params[:customer][:email])
    @customer.update(is_active: "false")
    redirect_to root_path
  end
  
  
  private
  
  def customer_params
    params.require(:customer).permit(:active)
  end
end
