class EducationsController < ApplicationController
  before_filter :authenticate_user!, :validate_prepper
  respond_to :json

	def create
		profile = Profile.find_by_id(params[:profile_id])
		education = Education.new(params[:education])
		education.profile_id = profile.id


		if education.save
			respond_with(education, :status => 201, :default_template => :show)
		else
			render json: education.errors, status: :unprocessable_entity
		end
	end

	def destroy
		education = Education.find(params[:id])
    education.destroy

    if education.destroy
			render json: education
		else
			respond_with(education.errors, status: :unprocessable_entity)
		end
  end

  private

	def validate_prepper
		if current_user.roles.first.name != "prepper"
			redirect_to "/422.html"
		end
	end

end
