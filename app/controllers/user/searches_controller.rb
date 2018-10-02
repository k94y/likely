class User::SearchesController < User::Base
  def index
  	@sel = params[:sel].to_i
  	if @sel == 1
  		#アーティスト
  		@res = Artist.where('name LIKE ?', "%#{params[:keyword]}%").select("id","name","name_kana")
  	elsif @sel == 2
  		#曲名
   		@res = Song.where('name LIKE ?', "%#{params[:keyword]}%").select("id","name")
  	elsif @sel == 3
  		#商品名
  		@res = Product.where('name LIKE ?', "%#{params[:keyword]}%").select("id","name")
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
