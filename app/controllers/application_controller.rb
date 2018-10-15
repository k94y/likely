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

  private
  def current_ability
    # I am sure there is a slicker way to capture the controller namespace
    controller_name_segments = params[:controller].split('/')
    controller_name_segments.pop
    controller_namespace = controller_name_segments.join('/').camelize
    @current_ability ||= Ability.new(current_user, controller_namespace)
  end
end

