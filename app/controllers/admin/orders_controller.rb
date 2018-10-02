class Admin::OrdersController < Admin::Base
  def index
  end

  def show
  end

  def update
  	order = Order.find(params[:id])
  	order.update(order_params)
	redirect_back(fallback_location: root_path)
  end

  def destroy
  	order = Order.find(params[:id])
  	order.destroy
  	redirect_to admin_user_path(order.user)
  end

  private
  	def order_params
  		params.require(:order).permit(:user_id, :shipment_status, :cancel_request)
  	end
end
