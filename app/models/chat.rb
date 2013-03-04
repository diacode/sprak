class Chat < ActiveRecord::Base
  attr_accessible :session_id

  belongs_to :creator, :class_name => "User"
  has_many :participants
  has_many :users, :through => :participants
end
