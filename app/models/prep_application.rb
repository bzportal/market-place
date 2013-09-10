class PrepApplication < ActiveRecord::Base
  attr_accessible :cover_letter, :status
  
  belongs_to :user
  belongs_to :prep
  has_one		 :contract
  has_many   :messages

  def elapsed
    diff = Time.now - self.created_at
    days  = (diff / 1.day).round
    hours = (diff / 1.hour).round
    mins  = (diff / 1.minute).round

    if days > 0
      elapsed_time = "#{days} day"
      elapsed_time += "s" unless days == 1
    elsif hours > 0
      elapsed_time = "#{hours} hour"
      elapsed_time += "s" unless hours == 1
    else
      elapsed_time = "#{mins} minute"
      elapsed_time += "s" unless mins == 1
    end
    elapsed_time
  end
end