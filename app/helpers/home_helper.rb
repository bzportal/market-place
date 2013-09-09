module HomeHelper
	def profile_sidebar_class(params)
		if controller.controller_name == params
			return :active
		end
		return ""
	end
end
