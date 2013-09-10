class PrepperController < ApplicationController
	before_filter :authenticate_user!, :validate_prepper, :scheduled_contracts

	def open_request
		@preps = Prep.where(status: "open")
		if @preps.size == 0
			flash[:alert] = "There is no Open preps"
		else
			flash[:alert] = nil
		end
	end

	def confirmed
		# Retrieve your invited preps which ask confirmation for scheduling
		@preps = Prep.joins(:prep_applications).where(status: "open", prep_applications: {user_id: current_user.id, status: "confirm"})
		if @preps.size == 0
			flash[:alert] = "There is no preps for confirmation"
		else
			flash[:alert] = nil
		end
	end

	def scheduled
		# Retrieve your contracts scheduled with preppee
		@preps = Prep.joins(:prep_applications).where(status: "scheduled", prep_applications: {user_id: current_user.id})
		if @preps.size == 0
			flash[:alert] = "There is no Scheduled preps"
		else
			flash[:alert] = nil
		end
	end

	private

	def validate_prepper
		if current_user.roles.first.name != "prepper"
			redirect_to "/422.html"
		end
	end

	def scheduled_contracts
		@scheduled_contracts = Contract.where(prepper_id: current_user.id)
		.group("contracts.due_start_date").count

	end
end