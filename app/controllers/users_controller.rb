class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit_profile
    @user = current_user
  end

  def update_profile
    update_avatar if params[:user][:image]
    about_me = params.require(:user).permit(:about_me)
    if current_user.update about_me
      flash[:notice] = "Profile Updated!"
    else
      flash[:notice] = "Something went wrong, please try again."
    end
      redirect_to user_path(current_user)
  end

  private

  def update_avatar
    image = params.require(:user).permit(:image)
    UserAvatar.create(image.merge(user_id: current_user.id))
    # When updating this method, handle un
  end

end
