class UsersController < ApplicationController

  def show
  end

  def edit
  end

  def update
    if current_user.update(user_params)
      redirect_to root_path
    else
      edit_user_registration_path
    end
  end

    private
    def user_params
      params.require(:user).permit(:name, :email)
    end
end
