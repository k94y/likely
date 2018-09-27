class User::MypagesController < User::Base
	def new
		@info = User.find(current_user.id)
	end

	def show
	end

	def edit
	end

	def create_info
		info_user = User.find(current_user.id)
		info_user.address = "#{info_user.state}#{info_user.city}#{info_user.place}"
		info_user.save
		redirect_to root_path
	end

	def update
	end

	def destroy
	end
end
