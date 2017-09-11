class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def create
    redirect_to root_path
  end
end
