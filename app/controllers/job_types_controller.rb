class JobTypesController < ApplicationController
	before_filter :validate_admin
	respond_to :json

	def create
		@job_type = JobType.new(params[:job_type])
		
		if @job_type.save
			respond_with(@job_type, :status => 201, :default_template => :show)
		else
			render json: @job_type.errors, status: :unprocessable_entity
		end
	end

	def update
		@job_type = Jobtype.find(params[:job_type])
		if @job_type.update_attributes(params[:job_type])
      respond_with(@job_type, :status => 200, :default_template => :show)
    else
      respond_with(@job_type.errors, status: :unprocessable_entity)
    end
	end

	def destroy
		@job_type = JobType.find(params[:id])
		if @job_type.destroy
			respond_with(@params[:id], :status => 204)
		else
			respond_with(@job_type.errors, status: :unprocessable_entity)
		end
	end

	private

	def validate_admin
		if current_user.roles.first.name != "admin"
			redirect_to "/422.html"
		end
	end
end