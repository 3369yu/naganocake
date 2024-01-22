class Public::HomesController < ApplicationController
  def top
    @item = Item.order(created_at: :desc).limit(4)
  end

  def about
  end
  
  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end
end
