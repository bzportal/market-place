class Profile < ActiveRecord::Base
  attr_accessible :token, :title, :photo, :feedback, :year_of_experience, 
      :address, :city, :country, :state, :zipcode, :phone,
  		:languages, :overview,
      :payment_method, :card_number, :ccvn, :expire_date, :zipcode

  belongs_to :user
  has_many :skills
  has_many :educations
  has_many :other_experiences
  has_many :pro_experiences
	before_create :generate_token

  has_attached_file :photo, :styles => { :medium => "200x200>", mini: "120x120>", tiny: "50x50" }, 
    storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    default_url: "/assets/blank_user.jpg", 
    path: "upload/:class/:attachment/:style/:filename"

  LANGUAGE_SKILLS = [ "1 - Basic written skills, no verbal skills", 
  "2 - Good written skills, no verbal skills",
  "3 - Fluent written skills, basic verbal skills",
  "4 - Fluent written skills, good verbal skills",
  "5 - Fluent in both written and verbal skills"
  ]

  def completeness
    percent = 0

    percent += 30 unless self.photo.url == ""
    percent += 30 if self.educations.exists?
    percent += 20 if self.skills.exists?
    percent += 20 if self.pro_experiences.exists?

    return percent
  end

  protected

  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(nil, false)
      break random_token unless Profile.where(token: random_token).exists?
    end
  end
end