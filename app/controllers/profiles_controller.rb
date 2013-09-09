class ProfilesController < ApplicationController
  before_filter :authenticate_user!
	
  def index
    @users = User.all
	end

	def create
		@profile = Profile.new(params[:profile])
		@profile.user_id = current_user.id
		
		if @profile.save
			redirect_to root_path
		else
			redirect_to new_profiles_path
		end
	end

	def payment
		@profile = current_user.profile
	end

	def edit
		@profile = current_user.profile
		@skill = Skill.new
		@education = Education.new
		@pro_experience = ProExperience.new
		@other_experience = OtherExperience.new
	end

	def show
		@profile = Profile.find_by_token(params[:id])
	end

	def update
		@profile = Profile.find_by_id(params[:id])

		respond_to do |format|
			if @profile.update_attributes(params[:profile])
				format.html { redirect_to edit_profile_path(@profile.token), :notice => "Profile overview is saved successfully." }
				format.js {}
				format.json { render json: @profile, status: :created }
	    else
	      format.html { redirect_to edit_profile_path(params[:profile][:token]), :alert => "Unable to update the member information." }
	      format.json { render json: @profile.errors, status: :unprocessable_entity }
	    end
	  end
	end
end