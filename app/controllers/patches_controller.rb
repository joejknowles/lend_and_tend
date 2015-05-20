class PatchesController < ApplicationController
  def new
    @patch = Patch.new
  end

  def create
    @patch = Patch.create patch_params
    flash[:notice] = "You have successfully added your #{@patch.size} patch."
    redirect_to '/'
  end

  def patch_params
    params.require(:patch).permit(:location, :size, :duration)
  end
end
