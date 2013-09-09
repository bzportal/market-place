class AdminController < ApplicationController
  before_filter :authenticate_user!, :validate_admin

	def index
	end

	def open_request
		@preps = Prep.where(status: "open")
		if @preps.size == 0
			flash[:alert] = "There is no Open preps"
		else
			flash[:alert] = nil
		end
	end

	def pricing_management
		@products = Product.all
		flash[:alert] = nil
	end

	def session_recordings
	end

	def accounting
	end

	def settings
		@job_types = JobType.all
		@job_type = JobType.new
		@skill_tags = SkillTag.all
		@skill_tag = SkillTag.new
	end

	private

	def validate_admin
		if current_user.roles.first.name != "admin"
			redirect_to "/422.html"
		end
	end

end