class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    Group.create(name: group_params[:name])
    redirect_to root_path
  end

    private
    def group_params
      params.require(:group).permit(:name)
    end

end
