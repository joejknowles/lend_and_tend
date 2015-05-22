class PatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    if params[:patch_type] && params[:patch_type] != '' && params[:offer_period] && params[:offer_period] != ''
      @patches = Patch.filtered_by_type(params[:patch_type]).filtered_by_duration(params[:offer_period]).includes(:user)
    elsif params[:patch_type] && params[:patch_type] != ''
      @patches = Patch.filtered_by_type(params[:patch_type]).includes(:user)
    elsif params[:offer_period] && params[:offer_period] != ''
      @patches = Patch.filtered_by_duration(params[:offer_period]).includes(:user)
    elsif params[:location].present?
      @patches = Patch.near(params[:location], 40)
    else
      @patches = Patch.all.includes(:user)
    end
  end

  def create
    @patch = Patch.new patch_params
    if @patch.save
      flash.notice = "You have successfully added your #{ @patch.patch_type } patch."
      redirect_to '/patches'
    else
      flash[:errors] = @patch.errors.full_messages
      redirect_to '/patches/new'
    end
  end

  def new
    @patch = Patch.new
  end

  def patch_params
    permitted_params = params.require(:patch).permit(:location, :patch_type, :duration, :description)
    permitted_params.merge(user_id: current_user.id)
  end
end
