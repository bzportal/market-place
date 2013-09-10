class PrepMailer < ActionMailer::Base
  default from: "admin@sleekgk.com"

  def invite(user, prep)
  	@user = user
  	@prep = prep
    mail(to: user.email, subject: "You are invited for prep")
  end

  def hired(preppee, user, prep)
    @prep = prep
    @preppee = preppee
    mail(to: user.email, subject: "Your application is approved")
  end

	def apply(user, prep)
		@user = user
  	@prep = prep

    mail(to: user.email, subject: "Someone has applied for your prep")
	end

	def confirmed(user, prep)
		@user = user
  	@prep = prep
    mail(to: user.email, subject: "Your prep is confirmed by your applicant")
	end
  
  def decline(user)
    mail(to: user.email, subject: "Your application is declined.")
  end

	def notify(user, prep)
		@user = user
  	@prep = prep
    mail(to: member.email, subject: "It's time to start prep")
	end

end