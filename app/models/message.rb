class Message < ActiveRecord::Base
  attr_accessible :from, :to, :subject, :body, :message_type, :attachment, :token

  belongs_to :prep_application
end