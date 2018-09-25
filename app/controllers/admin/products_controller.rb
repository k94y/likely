class Admin::ProductsController < Admin::Base
  def index
  end

  def new
    @product = Product.new
  end

  def create
    redirect_to admin_products_path
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
