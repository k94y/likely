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
				array.push(t.song.id)
			end
		end
	end
	array.uniq!
	@songs = Kaminari.paginate_array(array).page(params[:page]).per(10)
	# per(x)でページごとの表示件数をxに決定

  end
end
