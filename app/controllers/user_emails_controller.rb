class UserEmailsController < ApplicationController

  before_action :user_to_be_messaged

  def new

  end

  def create

    redirect_to user_path(@user)
  end

  def user_to_be_messaged
     @user = User.find(params[:user_id])
  end

end
