class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, 
    # Our custom fields
    :first_name, :last_name, :native_language_id, :interested_language_ids,
    :remote_avatar_url, :avatar

  belongs_to :native_language, :class_name => "Language"
  has_and_belongs_to_many :interested_languages, 
    :class_name => "Language", 
    :join_table => "interests"
  has_many :participants
  has_many :chats, :through => :participants

  validates :native_language, :presence => true

  scope :native, lambda { |lang| where("native_language_id = ?", lang.id) }

  mount_uploader :avatar, AvatarUploader
end
