class SkillTagsController < ApplicationController
	before_filter :validate_admin
	respond_to :json

	def create
		@skill_tag = SkillTag.new(params[:skill_tag])
		
		if @skill_tag.save
			respond_with(@skill_tag, :status => 201, :default_template => :show)
		else
			render json: @skill_tag.errors, status: :unprocessable_entity
		end
	end

	def update
		@skill_tag = SkillTag.find(params[:skill_tag])
		if @skill_tag.update_attributes(params[:skill_tag])
      respond_with(@skill_tag, :status => 200, :default_template => :show)
    else
      respond_with(@skill_tag.errors, status: :unprocessable_entity)
    end
	end

	def destroy
		@skill_tag = SkillTag.find(params[:id])
		if @skill_tag.destroy
			respond_with(params[:id], :status => 204)
		else
			respond_with(@skill_tag.errors, status: :unprocessable_entity)
		end
	end

	private

	def validate_admin
		if current_user.roles.first.name != "admin"
			redirect_to "/422.html"
		end
	end
end