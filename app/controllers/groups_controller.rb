class GroupsController < ApplicationController

  before_action :set_group, only: [:edit, :update]

  def index
    @groups = current_user.groups
    @group = Group.find_by(params[:id])
  end

  def new
    @group = Group.new
  end

  def edit
  end

  def update
    @group.update(group_params)
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      render :new
    end
  end

    private
    def group_params
      params.require(:group).permit(:name, user_ids: [])
    end

    def set_group
      @group = Group.find(params[:id])
    end

end
