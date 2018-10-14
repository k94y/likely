class Admin::ProductsController < Admin::Base
  def index
    @products = Product.page(params[:page]).per(20)
  end

  def new
    @artists = Artist.all
    @genres = Genre.all
    @labels = Label.all
    @songs = Song.all

    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    if product.save!
      redirect_to admin_products_path
    else
      redirect_to new_admin_product_path
    end
  end

  def edit
    @artists = Artist.all
    @genres = Genre.all
    @labels = Label.all
    @songs = Song.all

    @product = Product.find(params[:id])
  end

  def update
    product = Product.find(params[:id])
    if params[:request]
      stock = product.stock.to_i + params[:request].to_i
      if product.update!(stock: stock.to_i)
        redirect_to admin_products_path
      else
        redirect_to admin_products_path
      end
    else
      if product.update!(product_params)
        redirect_to admin_products_path
      else
        redirect_to new_admin_product_path
      end
    end

  end

  def destroy
    product = Product.find(params[:id])
    product.destroy!
    redirect_to admin_products_path
  end

  private
  def product_params
    params.require(:product).permit(
      :id, :name, :image, :product_type, :label_id, :genre_id, :price, :release_date,
      discs_attributes: [
        :id, :disc_order, :_destroy,
        track_relations_attributes: [
          :id, :song_id, :artist_id, :disk_id, :track_order,  :_destroy,
          song_attributes: [
            :id, :name, :file, :recommend_level, :file_cache, :remove_file
          ]
        ]
      ]
    )
  end

end
