class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role_ids, :as => :admin
  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me, :last_sign_in_at
  
  has_one :profile
  has_many :preps
  
  after_create :create_profile

  def fullname
    fullname = first_name + " " + last_name
  end

  protected

  def create_profile
    profile = Profile.new
    profile.user_id = self.id
    profile.save
  end
end