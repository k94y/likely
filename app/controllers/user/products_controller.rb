class User::ProductsController < User::Base
	before_action :authenticate_user!  
	def add
		cartd = CartDetail.new
		cartd.user_id = current_user.id
		cartd.product_id = params[:id]
		cartd.number = 1
		cartd.save
		redirect_to root_path
 	end
end
