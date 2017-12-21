class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :set_chats
  
  def set_chats
  	@chat_rooms = ChatRoom.all
  end

end
