class GroupsController < ApplicationController

  def index
    @groups = Group.all
    @group = Group.find_by(params[:id])
  end

  def new
    @group = Group.new
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    group = Group.find(params[:id])
      group.update(group_params)
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
      params.require(:group).permit(:name)
    end

end
