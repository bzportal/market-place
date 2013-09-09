class OtherExperience < ActiveRecord::Base
  attr_accessible :name, :description
  validates_presence_of :name
  
  belongs_to :profile
end