class City < ActiveRecord::Base

belongs_to :state

  has_many :categories_cities
  has_many :categories, :through => :categories_cities


end
