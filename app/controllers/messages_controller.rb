class MessagesController < ApplicationController

  before_action :set_group, only: [:index, :create]

  def index
    @groups = current_user.groups
    @message = Message.new
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path
    else
      redirect_to root_path, alert: "メッセージを入力してください"
    end
  end

  private
  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
  end
end
