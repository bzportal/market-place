class PrepApplicationsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :validate_prepper, only: [:create]
	before_filter :validate_preppee, only: [:decline]

	def create
		@application = PrepApplication.new(params[:prep_application])
		@application.prep_id = params[:prep_id]
		@application.user_id = current_user.id
		@application.status = "open"

		if @application.save
			PrepMailer.apply(current_user, @application.prep).deliver

			redirect_to "/prepper/open_request", notice: "You applied to this prep successfully!"
		else
			redirect_to prep_path(params[:prep_application][:prep_id]), alert: "Failed to apply for this prep"
		end
	end
	
	def index
		@prep = Prep.find_by_id(params[:prep_id])
		scheduled_contracts
		if @prep.prep_applications.empty?
			flash[:alert] = "There is no applicants for this prep"
		else
			flash[:alert] = nil
		end
	end


	def confirmed

		@application = PrepApplication.find_by_id!(params[:prep_application_id])
		@application.status = "scheduled"

		@application.prep.status = "scheduled"

		create_interview_session(@application.contract)
		@application.prep.save
		
		@application.save

		PrepMailer.confirmed(@application.prep.user, @application.prep).deliver

		redirect_to "/prepper/scheduled", notice: "Please visit /video_interview/party/" + @session.session_id.to_s + " for interview"
	end

	def decline
		@application = PrepApplication.find_by_id!(params[:prep_id])
		@application.status = "declined"

		if @application.save
			PrepMailer.decline(@application.user).deliver

			redirect_to prep_prep_applications_path(@application.prep), notice: "You declined new application successfully!"
		else
			redirect_to prep_prep_applications_path(@application.prep), alert: "Failed to decline this application"
		end
	end

	def withdraw
		@application = PrepApplication.find_by_id!(params[:prep_id])
		@application.status = "declined"

		if @application.save
			redirect_to prep_prep_applications_path(@application.prep), notice: "You declined new application successfully!"
		else
			redirect_to prep_prep_applications_path(@application.prep), alert: "Failed to decline this application"
		end
	end

	def show
		@prep = Prep.find_by_id(params[:prep_id])
		@application = PrepApplication.find_by_id(params[:id])
	end

	private

	def validate_prepper
		if current_user.roles.first.name != "prepper"
			redirect_to "/422.html"
		end
	end

	def validate_preppee
		if current_user.roles.first.name != "preppee"
			redirect_to "/422.html"
		end
	end

	def scheduled_contracts
		@scheduled_contracts = Contract.where(preppee_id: current_user.id)
		.group("contracts.due_start_date").count

	end

	def create_interview_session(contract)
		config_opentok

		session_properties = {OpenTok::SessionPropertyConstants::P2P_PREFERENCE => "enabled"}
    @session = @opentok.create_session nil, session_properties
    contract.session_id = @session.session_id

    contract.save
	end

  def config_opentok
    if @opentok.nil?
     @opentok = OpenTok::OpenTokSDK.new 22329432, "f03a315fc996dff095d697eb7949cbec1474c6ba"
    end
  end

end