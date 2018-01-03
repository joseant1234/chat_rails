class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :notifications, as: :notice
  has_many :members


  def read_notifications
  	notifications.pending.each do |notification|
  		notification.read!
  	end
  end
end
