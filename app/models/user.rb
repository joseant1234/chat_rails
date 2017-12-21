class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :chat_rooms, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :friendships
  has_many :followers, class_name: 'Friendship', foreign_key: 'friend_id'
  
  def name
  	email.split('@')[0]
  end


end
