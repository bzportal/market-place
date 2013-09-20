class VideoInterviewController < ApplicationController
	before_filter :config_opentok,:except => [:index]

  def show
    @contract = Contract.find_by_session_id(params[:id])
    
    if !@contract.nil?
    	@tok_token = @opentok.generate_token :session_id => @contract.session_id
    end

  end

  private
  def config_opentok
    if @opentok.nil?
     @opentok = OpenTok::OpenTokSDK.new 22329432, "f03a315fc996dff095d697eb7949cbec1474c6ba"
    end
  end

end