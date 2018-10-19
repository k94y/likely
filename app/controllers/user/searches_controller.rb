class User::SearchesController < User::Base
  def index
  	@sel = params[:sel].to_i
    @keyword = params[:keyword]
  	if @sel == 1
  		#アーティスト
      array = []
  		artists = Artist.where('name LIKE ?', "%#{params[:keyword]}%")
      artists.each do |art|
        songs = Song.where(artist_id: art.id)
        songs.each do |s|
          array << s
        end
      end
      flash[:notice] = "アーティスト名が \"#{@keyword}\" に類似する楽曲を表示します"
      @res = array.uniq
  	elsif @sel == 2
  		#曲名
      flash[:notice] = "曲名が \"#{@keyword}\" に類似する楽曲を表示します"
       @res = Song.where('name LIKE ?', "%#{params[:keyword]}%")
  	elsif @sel == 3
  		#商品名
      array = []
  		products = Product.where('name LIKE ?', "%#{params[:keyword]}%")
      products.each do |pro|
        pro.discs.each do |d|
          d.track_relations.each do |tr|
              array << tr.song
          end
        end
      end
      flash[:notice] = "商品名が \"#{@keyword}\" に類似した商品に含まれる楽曲を表示します"
      @res = array.uniq
  	else
  		redirect_to root_path
  	end
  end

  def create
  	#パラメータからクエリパラメータを含むurlを生成する。
  	arg = {sel: params[:sel], keyword: params[:keyword]}
    redirect_to "/searches?#{arg.to_query}"
  end
end
