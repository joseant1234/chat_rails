class Notification < ApplicationRecord
  include AASM
  belongs_to :notice, polymorphic: true

  enum state:{
    pending: 0,
    readed: 1
  }

  aasm :column => :state, :enum => true do
  	state :pending, :initial => true
  	state :readed

    event :read do
      transitions :from => :pending, :to => :readed
    end
  end

end
