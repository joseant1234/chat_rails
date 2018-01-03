class MessageBroadcastJob < ApplicationJob
	queue_as :default

	def perform(message)
		ActionCable.server.broadcast "chat_room_#{message.chat_room_id}_channel", message: render_message(message), source: 'messages'
	end

	private
	def render_message(message)
		MessagesController.render partial: 'messages/message', locals: {message: message}
	end
end