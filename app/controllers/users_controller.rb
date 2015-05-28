class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit_profile
    @user = current_user
  end

  def update_avatar
    if params[:user] && params[:user][:image]
      image = params.require(:user).permit(:image)
      image_to_save = UserAvatar.new(image.merge(user_id: current_user.id))
      flash[:notice] = 'There was a problem, please try again!' unless image_to_save.save
    else
      flash[:notice] = 'Please remember to attach a photo'
    end
    redirect_to '/users/edit_profile'
  end

  def update_profile
    about_me = params.require(:user).permit(:about_me)
    current_user.update about_me
    redirect_to user_path(current_user)
  end
end
