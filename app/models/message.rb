class Message < ApplicationRecord
  include AASM
  belongs_to :user
  belongs_to :chat_room

  validates :body, presence: true, length: {minimum: 2, maximum: 1000}

  after_create_commit { MessageBroadcastJob.perform_later(self) }
  after_create_commit :send_notification

  def timestamp
  	created_at.strftime('%H:%M:%S %d %B %Y')
  end

  private
  def send_notification
    RoomBroadcastJob.perform_later(self) 
  end

end
