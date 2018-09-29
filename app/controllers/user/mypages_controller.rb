class User::MypagesController < User::Base
	def new
		if user_signed_in?
			@info = User.find(current_user.id)
		else
			redirect_to root_path
		end
	end

	def show
	end

	def edit
	end

	def create_info
		info_user = User.find(current_user.id)
		#info_user.address = "#{info_user.state}#{info_user.city}#{info_user.place}"
		info_user.update(user_params)
		redirect_to root_path
	end

	def update
	end

	def destroy
	end

	def user_params
  	params.require(:user).permit(:state, :city, :address, :name, :name_kana, :postal_code, :tel)
  end
end
