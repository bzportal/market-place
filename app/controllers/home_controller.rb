class HomeController < ApplicationController

  def index
  	unless current_user.nil?
			case current_user.roles.first.name
	      when 'admin'
	        redirect_to "/admin/open_request"
	      when 'preppee'
	        redirect_to "/preppee/open_request"
	      when 'prepper'
	        redirect_to "/prepper/open_request"
	      else
	        redirect_to root_path
	    end
	  end
  end
end