class Place < ActiveRecord::Base

belongs_to :city
  
  has_many :categories_places
  has_many :categories, :through => :categories_places

end
