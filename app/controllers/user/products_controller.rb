class User::ProductsController < User::Base
	before_action :authenticate_user!
	def add
		if CartDetail.where(user_id: current_user.id, product_id: params[:id]).present?
			flash[:notice] = "カート内に既に存在しています"
			redirect_to carts_path
		else
			cartd = CartDetail.new(cartd_params)
			cartd.user_id = current_user.id
			cartd.product_id = params[:id]
			if cartd.save
				cartd.product.stock -= cartd.number
				redirect_to carts_path
			else
				render 'songs/show'
			end
		end
 	end

 	private
 		def cartd_params
 			params.permit(:number)
 		end
end
