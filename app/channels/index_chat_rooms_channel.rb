class IndexChatRoomsChannel < ApplicationCable::Channel
  def subscribed
    stream_from "index_chat_rooms_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def send_message(data)
	# process data sent from the page
  end
end
