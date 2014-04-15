class Event < ActiveRecord::Base
 validates :title, :description, presence: true
 
 has_many :comments, as: :imageable

 has_many :images, as: :imageable
 accepts_nested_attributes_for :images


 #has_attached_file :avatar

 #validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end