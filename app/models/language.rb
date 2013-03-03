class Language < ActiveRecord::Base
  attr_accessible :name

  has_many :native_speakers, 
    :class_name => "User", 
    :foreign_key => "native_language_id"

  has_and_belongs_to_many :interested_users, 
    :class_name => "User", 
    :join_table => "interests"
end
