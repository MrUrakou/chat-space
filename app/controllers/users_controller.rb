class UsersController < ApplicationController

  def show
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
      user = User.find(params[:id])
      user_id == current_user.id ? user.update(user_params) : redirect_to root_path
  end

    private
    def user_params
      params.permit(:name, :email)
    end
end
