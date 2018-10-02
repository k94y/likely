class User::OrdersController < User::Base
  def index
    @orders = current_user.orders.reverse
  end

  def new
    @cart_details = current_user.cart_details

    @sum = 0
    @cart_details.each do |c|
      @sum += c.product.price * c.number
    end
  end

  def create
    order = Order.new
    order.user_id = current_user.id
    if order.save!
      current_user.cart_details.each do |c|
        order_detail = OrderDetail.new
        order_detail.order_id = order.id
        order_detail.product_id = c.product.id
        order_detail.price = c.product.price
        order_detail.number = c.number
        order_detail.save!
      end

      CartDetail.where(user_id: current_user.id).destroy_all
      redirect_to root_path, notice: "注文を確定しました"
    else
      redirect_to new_order_path, alert: "注文に失敗しました、再度確定ボタンをお願いします。"
    end
  end

  def update
  end

end
