class User::CartsController < User::Base
  def index
  	@carts = CartDetail.where(user_id: current_user.id)
  end

  def create
  end

  def update
  	cart = CartDetail.find(params[:id])
  	cart.update(cart_params)
  	redirect_to carts_path
  end

  def destroy
  	cart = CartDetail.find(params[:id])
  	cart.destroy
  	redirect_to carts_path
  end

  private
  	def cart_params
  		params.require(:cart_detail).permit(:user_id, :product_id, :number)
  	end
end
