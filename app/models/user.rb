class User < ActiveRecord::Base
 acts_as_authentic

  has_one :profile
has_many :meetings
end
