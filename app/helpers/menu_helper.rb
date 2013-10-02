module MenuHelper
	def active_menu_class(controller_name, action)
		if controller.controller_name == controller_name
			if params[:action] == action.to_s
				return "active"
			else
				return
			end
		end
	end

	def header_class
		if landing_page
			return "header"
		else
			return "dark-header"
		end
	end
end