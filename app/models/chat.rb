require "net/http" 

class Chat < ActiveRecord::Base
  attr_accessible :session_id, :creator_id

  belongs_to :creator, :class_name => "User"
  has_many :participants
  has_many :users, :through => :participants

  def notify(user)
    data = {
      :event_type => "NEW_CHAT",
      :from => "#{creator.first_name} #{creator.last_name}",
      :path => "/chats/#{self.id}/show" 
    }
    message = {:channel => "/users/#{user.id}", :data => data, :ext => {:auth_token => FAYE_TOKEN}}
    uri = URI.parse("http://localhost:9292/faye")
    Net::HTTP.post_form(uri, :message => message.to_json)
  end
end
