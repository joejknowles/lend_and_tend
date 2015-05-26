class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit_profile
  end

  def update_profile
    image = params.require(:user).permit(:image)
    about_me = params.require(:user).permit(:about_me)

    current_user.update about_me
    UserAvatar.create(image.merge(user_id: current_user.id))
    redirect_to user_path(current_user)
  end
end
