class RegistrationsController < Devise::RegistrationsController

  def new
    @plan = params[:plan]
    if @plan && !Role.find_by_name(@plan).nil? && @plan != "admin"
      super
    else
      redirect_to root_path, :notice => 'Please select user type.'
    end
  end

  def update_card
    @user = current_user
    @user.stripe_token = params[:user][:stripe_token]
    if @user.save
      redirect_to edit_user_registration_path, :notice => 'Updated card.'
    else
      flash.alert = 'Unable to update card.'
      render :edit
    end
  end
  
  def after_sign_up_path_for(resource)
    case current_user.roles.first.name
      when 'admin'
        "/admin/open_request"
      when 'preppee'
        "home#welcome"
      when 'prepper'
        "home#welcome"
      else
        root_path
    end
  end

  def after_inactive_sign_up_path_for(resource)
    "/verify_by_email"
  end

  private
  def build_resource(*args)
    super
    if params[:plan]
      resource.add_role(params[:plan])
    end
  end
end
