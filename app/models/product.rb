class Product < ActiveRecord::Base
  attr_accessible :name, :price, :product_type, :session_type, :session_length,
  				:cover, :book_url, :description # for guide book

  has_attached_file :cover, :styles => { :medium => "150x200>", mini: "50x50>" }, 
  	storage: :dropbox,
    # default_url: "/assets/blank_book_cover.jpg",
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    path: ":rails_root/public/upload/:class/:attachment/:style/:filename",
  	url: "/upload/:class/:attachment/:style/:filename"

  has_attached_file :book_url, 
  	storage: :dropbox,
    dropbox_credentials: Rails.root.join("config/dropbox.yml"),
    path: ":rails_root/public/upload/:class/:attachment/:style/:filename",
  	url: "/upload/:class/:attachment/:style/:filename"

  validates_presence_of :name, :price, :product_type
  validates_uniqueness_of :name

  has_many :preps
  
  PRODUCT_TYPE = ["Interview Prep", "Review Document", "Guidebook"]
  SESSION_TYPE = ["Internship", "Fulltime Position", "Information Interview"]

  def product_name
    PRODUCT_TYPE[self.product_type]
  end

  def session_name
    SESSION_TYPE[self.session_type]
  end
end