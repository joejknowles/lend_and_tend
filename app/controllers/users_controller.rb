class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit_profile
  end

  def update_profile
  end


end
