class Admin::OrdersController < Admin::Base
  load_and_authorize_resource class: false
  def index
    @orders = Order.all.order("id DESC")
  end

  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)
  end

  def update
  	order = Order.find(params[:id])
  	order.update(order_params)
	redirect_back(fallback_location: root_path)
  end

  def destroy
  	order = Order.find(params[:id])
  	order.destroy
  	redirect_to admin_orders_path
  end

  private
  	def order_params
  		params.require(:order).permit(:user_id, :shipment_status, :cancel_request)
  	end
end
