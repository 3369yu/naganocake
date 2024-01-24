class Admin::ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to admin_item_path
      flash[:notice] = "商品を登録しました"
    else
      render :edit
    end
  end

  def show
    @item = Item.gind(params[:id])
  end

  def edit
    @item = Item.gind(params[:id])
  end

  def update
    @item = Item.gind(params[:id])
    if @item.update(item_params)
      redirect_to admin_item_path
    else
      render :edit
    end
  end
end
