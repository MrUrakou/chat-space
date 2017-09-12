class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @groupname = "#{@group.name}"
    @members = @group.users
  end

  def new
    @message = Message.new
  end

  def update
    @group.update(group_params)
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to root_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:text, :image, :group_id)
  end
end
