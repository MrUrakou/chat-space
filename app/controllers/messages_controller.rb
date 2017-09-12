class MessagesController < ApplicationController

  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @groupname = "#{@group.name}"
    @members = @group.users
    @message = Message.new
  end

  def update
    @message.update(message_params)
  end

  def create
    @group = Group.find(params[:group_id])
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
