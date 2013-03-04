class ChatsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :init_opentok

  def create    
    guest = User.find(params[:guest_id])

    # Create the session in opentok
    session_id = @opentok.create_session('localhost').session_id

    # Create our chat object
    chat = Chat.create(:session_id => session_id, :creator_id => current_user.id)
    
    chat.users << current_user
    chat.users << guest

    chat.notify(guest)

    redirect_to chat_url(chat)    
  end

  def show
    @chat = Chat.find(params[:id])

    # Generation of token
    @token = @opentok.generate_token :session_id => @chat.session_id, :role => OpenTok::RoleConstants::PUBLISHER, :connection_data => "userid=#{current_user.id}"
  end

  private 
    def init_opentok
      @opentok = OpenTok::OpenTokSDK.new APP_CONFIG['opentok_api_key'], APP_CONFIG['opentok_api_secret']
    end
end
