class PatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @patches = Patch.all.includes(:user)
  end

  def create
    @patch = Patch.new patch_params
    if @patch.save
      flash.notice = "You have successfully added your #{ @patch.patch_type } patch."
      redirect_to '/'
    else
      flash[:errors] = @patch.errors.full_messages
      redirect_to '/patches/new'
    end
  end

  def new
    @patch = Patch.new
  end

  def patch_params
    permitted_params = params.require(:patch).permit(:location, :patch_type, :duration)
    permitted_params.merge(user_id: current_user.id)
  end
end