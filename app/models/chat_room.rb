class ChatRoom < ApplicationRecord
  belongs_to :user
  has_many :messages, dependent: :destroy
  has_many :notifications, as: :notice
end
