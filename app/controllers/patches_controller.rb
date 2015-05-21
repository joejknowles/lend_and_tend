class PatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:patch_type]
      @patches = Patch.filtered_by_type(params[:patch_type])
    else
      @patches = Patch.all
    end
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
    params.require(:patch).permit(:location, :patch_type, :duration)
  end
end
