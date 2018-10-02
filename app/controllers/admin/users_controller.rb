class Admin::UsersController < Admin::Base
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @orders = Order.where(user_id: @user.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
