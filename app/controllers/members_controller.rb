class MembersController < ApplicationController
  before_action :set_chat_room, only: [:index, :create]
  before_action :set_member, only: [:destroy]
  autocomplete :user, :email, :full => true

  def index
    @members = @chat_room.members
    @member = Member.new
  end

  def create
    @member = @chat_room.members.new(member_params)
    if @member.save
      @members = @chat_room.members
      @member = Member.new
    else
      render partial: 'errors/errors_toast', locals: { resource: @member }
    end
  end

  def destroy
    @member.destroy
  end

  private
  def set_chat_room
    @chat_room = ChatRoom.find(params[:chat_room_id])
  end

  def set_member
    @member = Member.find(params[:id])
  end

  def member_params
    params.require(:member).permit(:user_id)
  end
end