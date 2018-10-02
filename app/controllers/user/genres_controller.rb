class User::GenresController < User::Base
  def index
  	@genres = Genre.all
  end

  def show
  	@genre = Genre.find(params[:id])
  	@products = Product.where(genre_id: params[:id])
  end
end
