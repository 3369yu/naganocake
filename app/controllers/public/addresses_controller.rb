class Public::AddressesController < ApplicationController
  before_action :authenticate_customer!

  def index
    @address = Address.new
    @addresses = current_customer.addresses.all
  end

  def new
    @address = Address.new
  end

  def edit
    @address = Address.find(params[:id])
    @address.customer_id = current_customer.id
  end

  def create
    @address = Address.new(address_params)
    @address.customer_id = current_customer.id
    if @address.save
      flash[:notice] = "配送先を登録しました"
      redirect_to addresses_path
    else
      @addresses = Address.all
      render :index
    end
  end

  def update
    @address = Address.find(params[:id])
    @address.customer_id = current_customer.id
    if @address.update(address_params)
      flash[:notice] = "配送先を編集しました"
      redirect_to addresses_path
    else
      render edit_address_path
    end
  end

  def destroy
    address = Address.find(params[:id])
    address.customer_id = current_customer.id
    if address.destroy
      flash[:notice] = "配送先を削除しました"
      redirect_to addresses_path
    else
      render addresses_path
    end
  end

  private

  def address_params
     params.require(:address).permit(:customer_id, :postal_code, :address, :name)
  end

end
