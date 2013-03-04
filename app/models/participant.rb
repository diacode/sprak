class Participant < ActiveRecord::Base
  belongs_to :user
  belongs_to :chat
  attr_accessible :token, :user_id, :chat_id
end
