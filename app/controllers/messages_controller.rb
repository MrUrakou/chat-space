class MessagesController < ApplicationController

  before_action :set_group, only: [:index, :create]

  def index
    @message = Message.new
    @messages = @group.messages
    respond_to do |format|
      format.html
      format.json { @new_message = @messages.where('id > ?', params[:id]) }
    end
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, flash: { notice: "送信しました"} }
        format.json
      end
    else
      flash.now[:alert] = "入力してください"
      render :index
    end
  end

  private
  def message_params
    params.require(:message).permit(:text, :image).merge(group_id: params[:group_id], user_id: current_user.id)
  end

  def set_group
    @group = Group.find(params[:group_id])
    @groups = current_user.groups
  end
end
