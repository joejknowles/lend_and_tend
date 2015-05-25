class UserEmailsController < ApplicationController

  before_action :user_to_be_messaged

  def new

  end

  def create
    UserMailer.match_request(@user, current_user, params[:your_message]).deliver_now
    redirect_to user_path(@user), notice: "Message sent!"
  end

  def user_to_be_messaged
     @user = User.find(params[:user_id])
  end

end
