class UserAvatarsController < ApplicationController

  def destroy
    UserAvatar.destroy params[:id]
    redirect_to user_path(current_user), notice: 'Photo removed!'
  end
end
