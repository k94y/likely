class ApplicationController < ActionController::Base
	protected
	def after_sign_up_path_for(resource)
		"https://www.google.com"
	end

	def configure_permitted_parameters
		#emailは必須
		devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email])
		devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
 	end
end
