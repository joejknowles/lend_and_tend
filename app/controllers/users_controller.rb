class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit_profile
  end

  def update_profile
    about_me = params.require(:user).permit(:about_me)
    current_user.update about_me
    redirect_to user_path(current_user)
  end

end
