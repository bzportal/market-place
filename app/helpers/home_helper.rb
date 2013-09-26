module HomeHelper
	def profile_sidebar_class(params)
		if controller.controller_name == params
			return :active
		end
		return ""
	end

	def landing_page
		return true if !user_signed_in? && params[:action] == "index"

	end
end
