class Chat < ActiveRecord::Base
  belongs_to :creator, :class_name => "User"
  attr_accessible :session_id
end
