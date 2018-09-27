class Admin::ProductsController < Admin::Base
  def index
  end

  def new
    @product = Product.new
    @product.discs.new
    @product.discs.first.track_relations.new
  end

  def create
    product = Product.new(product_params)
    if product.save
      redirect_to admin_products_path
    else
      redirect_to new_admin_product_path
    end
    
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def product_params
    params.require(:product).permit(
      :id, :name, :image, :type, :label, :genre, :price, :release_date,
      disks_attributes: [
        :id, :disk_order, :_destroy,
        track_relations_attributes: [
          :id, :song_id, :artist_id, :disk_id, :track_order,  :_destroy
        ]
      ]
    )
  end
end
