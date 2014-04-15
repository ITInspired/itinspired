class Post < ActiveRecord::Base
 validates :title, :description, presence: true
 has_many :comments, as: :imageable

 has_many :images, as: :imageable
 accepts_nested_attributes_for :images

 def self.search(query)
    # where(:title, query) -> This would return an exact match of the query
    where("title like ?", "%#{query}%") 
 end

end
