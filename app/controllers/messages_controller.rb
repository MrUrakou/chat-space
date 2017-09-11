class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def create
    @message = Message.new(group_params)
    if @message.save
      redirect_to root_path
    end
  end

  private
  def message_params
    params.require(:message).permit(:text, :image)
  end
end
