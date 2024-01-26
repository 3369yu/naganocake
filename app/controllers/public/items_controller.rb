class Public::ItemsController < ApplicationController
  def index
    if params[:name]
      @name = params[:name]
      @item = Item.where(['name LIKE ?', "%#{@name}%"])
    elsif params[:genre_id]
      @genre_id = params[:genre_id]
      @item = Item.where(genre_id: @genre_id)
    else
      @item = Item.page(params[:page]).per(10)
    end
  end

  def show
    @item = Item.find(params[:id])
    @cart_item = CartItem.new
    @genres = Genre.all
    @ganrename = Genre.name
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end


  private

  def item_params
    params.require(:item).permit(:name, :introduction, :price, :image, :genre_id, :is_active, :genre_name)
  end

end
