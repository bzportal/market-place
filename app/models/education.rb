# Represents the user's education
class Education < ActiveRecord::Base
  attr_accessible :from, :to, :school, :degree, :area_of_study, :comments
  validates_presence_of :from, :to, :school, :degree, :area_of_study
  
  belongs_to :profile

  DEGREES = ["Doctorate", "Master's", "Bachelor's", "Associate's", "Diploma", "High School", "Other"]

end