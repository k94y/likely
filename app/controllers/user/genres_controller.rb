class User::GenresController < User::Base
  def index
  	@genres = Genre.all
  end

  def show
  	@genre = Genre.find(params[:id])

  	array = []
  	products = Product.where(genre_id: params[:id])
	products.each do |product|
		product.discs.each do |disc|
			disc.track_relations.each do |t|
				array.push({
					id: t.song.id,
					product_id: t.disc.product.id,
					name: t.song.name,
					artist: t.artist.name,
				})
			end
		end
	end
	@songs = Kaminari.paginate_array(array).page(params[:page]).per(10)
	# per(x)でページごとの表示件数をxに決定

  end
end
