class Language < ActiveRecord::Base
  attr_accessible :name

  has_many :native_speakers, 
    :class_name => "User", 
    :foreign_key => "native_language_id"
end
