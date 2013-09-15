module PrepsHelper

	def get_job_name(id)
		job_type = JobType.find_by_id(id)
		return job_type.name unless job_type.nil?
	end

end
