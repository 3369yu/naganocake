class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @genre = Genre.all
  end

  def new
    @genre = genre.new
  end

  def create
    @genre = genre.new(genre_params)
    @gemre.save
    redirect_to genre_path
  end

  def edit
    @genre = genre.find(params[:id])
  end

  def update
    @genre = genre.find(params[:id])
    @genre.update(genre.params)
  end
  
  def genre_params
    params.require(:genre).permit(:name)
    redirect_to genre_path
  end
  
end
