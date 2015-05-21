class PatchesController < ApplicationController
  def new
    @patch = Patch.new
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

  def patch_params
    params.require(:patch).permit(:location, :patch_type, :duration)
  end
end
