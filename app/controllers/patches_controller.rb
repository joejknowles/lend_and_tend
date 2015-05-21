class PatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    @patches = Patch.all
  end

  def create
    @patch = Patch.new patch_params
    if @patch.save
      flash[:notice] = "You have successfully added your #{@patch.size} patch."
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
    params.require(:patch).permit(:location, :size, :duration)
  end
end
