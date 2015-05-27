class PatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @patches = Patch.location_sort(params, 40)
    @patches = @patches.filter_results(params)
  end

  def create
    @patch = Patch.new patch_params
    @patch.patch_images.new patch_image_params
    if @patch.save
      flash.notice = "You have successfully"\
      " added your #{ @patch.patch_type } patch."
      redirect_to "/users/#{current_user.id}"
    else
      flash[:errors] = @patch.errors.full_messages
      redirect_to '/patches/new'
    end
  end

  def new
    @patch = Patch.new
  end

  protected

  def patch_params
    permitted_params = params.require(:patch).permit(
      :location, :patch_type, :duration, :description)
    permitted_params.merge(user_id: current_user.id)
  end

  def patch_image_params
    params.require(:patch).permit(:image)
  end
end
