class PrepsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :validate_preppee, only: [:new, :create, :edit, :update, :destroy]

	def new
		@prep = Prep.new
		@prep.prep_type = params[:prep_type]
	end

	def create
		skills = params[:prep][:required_skills]
		skill_names = Array.new
		skills.each do |s|
			skill = SkillTag.find_by_id(s)
			skill_names.push skill.name unless skill.nil?
		end
		params[:prep][:required_skills] = skill_names.join(",")

		prep = Prep.create(params[:prep])
		prep.user_id = current_user.id
		prep.status = :open # status: open->confirm->scheduled->processing->paid->feedback
		if prep.save
			redirect_to "/preppee/open_request", notice: "New prep is created successfully"
		else
			redirect_to "/preppee/open_request", alert: "Failed to create new Prep"
		end
	end

	def edit
	end

	def update
	end

	def show # for prepper
		@prep = Prep.find(params[:id])
		@applied = @prep.prep_applications.find_by_user_id(current_user.id)
		@product = @prep.product
	end

	def index
	end

	def destroy
	end

	private

	def validate_preppee
		if current_user.roles.first.name != "preppee"
			redirect_to "/422.html"
		end
	end

end
