class ProExperience < ActiveRecord::Base
  attr_accessible :title, :company_name, :location, :from, :to, :description
	validates_presence_of :title, :company_name, :from, :to
	
  belongs_to :profile
end