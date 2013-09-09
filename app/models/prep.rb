class Prep < ActiveRecord::Base
  attr_accessible :title, :prep_type, :job_type_id, :product_id, :required_skills, :description, :attachment_url, :status
  validates_presence_of :title, :prep_type, :required_skills, :description

  has_attached_file :attachment_url, 
    storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    path: ":rails_root/public/upload/:class/:attachment/:style/:filename",
    url: "/upload/:class/:attachment/:style/:filename"

  belongs_to :user
  belongs_to :product
  has_many :prep_applications

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