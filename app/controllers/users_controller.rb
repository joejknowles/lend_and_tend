class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  def edit_profile
    @user = current_user
  end

  def update_profile
    if params[:user]
      if params[:user][:image]
        image = params.require(:user).permit(:image)
        UserAvatar.create(image.merge(user_id: current_user.id))
      end
      about_me = params.require(:user).permit(:about_me)
      current_user.update about_me
    else
      flash[:notice] = 'Please remember to attach a photo'
    end
    redirect_to user_path(current_user)
  end
end
