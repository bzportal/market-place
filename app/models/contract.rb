class Contract < ActiveRecord::Base
  attr_accessible :due_start_date, :due_start_time, :start_time, :end_time, :status, :feedback, :comments, :session_id, :token
  validates_presence_of :due_start_date
  
  belongs_to :prep_application
end