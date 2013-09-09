class ProExperiencesController < ApplicationController
  before_filter :authenticate_user!, :validate_prepper
	respond_to :json

	def create
		profile = Profile.find_by_id(params[:profile_id])
		pro_experience = ProExperience.new(params[:pro_experience])
		pro_experience.profile_id = profile.id

		if pro_experience.save
			respond_with(pro_experience, :status => 201, :default_template => :show)
		else
			render json: pro_experience.errors, status: :unprocessable_entity
		end
	end
	
	def update
	end

	def destroy
		pro_experience = ProExperience.find(params[:id])

		if pro_experience.destroy
			render json: pro_experience
		else
			respond_with(pro_experience.errors, status: :unprocessable_entity)
		end
	
  end

  private

	def validate_prepper
		if current_user.roles.first.name != "prepper"
			redirect_to "/422.html"
		end
	end

end