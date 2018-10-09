class Admin::UsersController < Admin::Base
  def index
    @users = User.page(params[:page]).per(20)
  end

  def show
    @user = User.find(params[:id])
    @orders = Order.where(user_id: @user.id)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
       redirect_to admin_users_path
      else
        render :edit
      end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to admin_users_path
  end

  private
  def user_params
    params.require(:user).permit(:state, :city, :address, :name, :name_kana, :postal_code, :tel, :admin)
  end
end
