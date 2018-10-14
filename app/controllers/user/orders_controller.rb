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
        bool = 0
        current_user.cart_details.each do |c|
          c.product.with_lock do    #悲観的ロック
            if c.product.stock >= c.number
              order_detail = OrderDetail.new
              order_detail.order_id = order.id
              order_detail.product_id = c.product.id
              order_detail.price = c.product.price
              order_detail.number = c.number
              order_detail.save!
              order_detail.product.update(stock: order_detail.product.stock - order_detail.number)
            else
              bool += 1
            end
          end
        end

        if bool == 0
          CartDetail.where(user_id: current_user.id).destroy_all
          redirect_to root_path, notice: "注文を確定しました"
        else
          order.order_details.each do |o|
            o.product.update(stock: o.product.stock + o.number)
          end
          order.destroy
          redirect_to carts_path, notice: "注文に失敗しました"
        end
      else
        redirect_to carts_path, notice: "注文に失敗しました"
      end
  end

  def update
    order = Order.find(params[:id])
    order.update!(cancel_request: true)
    redirect_to orders_path
  end

end
