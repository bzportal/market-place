class PreppeeController < ApplicationController
	before_filter :authenticate_user!, :validate_preppee

	def open_request
		@preps = current_user.preps.where(status: "open")
		if @preps.size == 0
			flash[:alert] = "There is no Open preps"
		else
			flash[:alert] = nil
		end
	end

	def scheduled
		@preps = current_user.preps.where(status: "scheduled")
		if @preps.size == 0
			flash[:alert] = "There is no Scheduled preps"
		else
			flash[:alert] = nil
		end
	end

	private

	def validate_preppee
		if current_user.roles.first.name != "preppee"
			redirect_to "/422.html"
		end
	end
end