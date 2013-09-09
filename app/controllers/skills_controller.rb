class SkillsController < ApplicationController
  before_filter :authenticate_user!, :validate_prepper
  respond_to :json

	def create
		profile = Profile.find_by_id(params[:profile_id])
		params[:skill][:name] = SkillTag.find_by_id(params[:skill][:name].to_i).name
		skill = Skill.new(params[:skill])
		skill.profile_id = profile.id

		if skill.save
			respond_with(skill, :status => 201, :default_template => :show)
		else
			render json: skill.errors, status: :unprocessable_entity
		end
	end

	def destroy
		skill = Skill.find(params[:id])
		if skill.destroy
			render json: skill
		else
			respond_with(skill.errors, status: :unprocessable_entity)
		end
  end
  
  private

	def validate_prepper
		if current_user.roles.first.name != "prepper"
			redirect_to "/422.html"
		end
	end
end