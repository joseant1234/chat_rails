class RoomBroadcastJob < ApplicationJob
	queue_as :default

	def perform(message)
		message.chat_room.notifications.create!
		ActionCable.server.broadcast "chat_rooms_channel", room: render_room(message.chat_room), source: 'rooms', room_id: message.chat_room_id
	end

	private
	def render_room(chat_room)
		ChatRoomsController.render partial: 'chat_rooms/chat_room', locals: {chat_room: chat_room}
	end
end