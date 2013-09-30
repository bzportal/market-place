class ApplicationController < ActionController::Base
  protect_from_forgery

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_path, :alert => exception.message
  end

  def after_sign_in_path_for(resource)
    case current_user.roles.first.name
      when 'admin'
        "/admin/open_request"
      when 'preppee'
        if params[:confirmation_token]
          "/preppee/welcome"
        else
          "/preppee/open_request"
        end
      when 'prepper'
        if params[:confirmation_token]
          "/prepper/welcome"
        else
          "/prepper/open_request"
        end
      else
        root_path
    end
  end
end