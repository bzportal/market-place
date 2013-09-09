class OtherExperiencesController < ApplicationController
  before_filter :authenticate_user!, :validate_prepper
	respond_to :json

	def create
		profile = Profile.find_by_id(params[:profile_id])
		other_exp = OtherExperience.new(params[:other_experience])
		other_exp.profile_id = profile.id

		if other_exp.save
			respond_with(other_exp, :status => 201, :default_template => :show)
		else
			render json: other_exp.errors, status: :unprocessable_entity
		end
	end

	def destroy
		other_exp = OtherExperience.find(params[:id])
    
    if other_exp.destroy
			render json: other_exp
		else
			respond_with(other_exp.errors, status: :unprocessable_entity)
		end

  end

  private

	def validate_prepper
		if current_user.roles.first.name != "prepper"
			redirect_to "/422.html"
		end
	end

end