class Admin::TopsController < Admin::Base
	before_action :authenticate_user!
  def index
  	#管理者以外はroot_pathへ！
  	redirect_to root_path if current_user.customer?
  end
end
