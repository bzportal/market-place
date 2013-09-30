module HomeHelper
	def profile_sidebar_class(params)
		if controller.controller_name == params
			return :active
		end
		return ""
	end

	def landing_page
		return true if controller.controller_name == "home"
	end

	def signup_page
		return true if params[:action] == "select_user" || controller.controller_name == "users"
		return false
	end

	def completeness
		return current_user.profile.completeness unless current_user.profile.nil?
		return 0
	end
end