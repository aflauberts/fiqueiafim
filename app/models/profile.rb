class Profile < ActiveRecord::Base
  belongs_to :user

  
  validates_presence_of :first_name
  validates_length_of :first_name, :within => 2..20

  validates_presence_of :last_name
  validates_length_of :last_name, :within => 2..20

  validates_presence_of :sex
  validates_presence_of :orientation
end
