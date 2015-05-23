class PatchesController < ApplicationController
  before_action :authenticate_user!

  def index
    filtered_params = params.permit(
      :duration, :patch_type).reject { |_k, v| v == '' }
    if params[:location].present?
      @patches = Patch.near(
        params[:location], 40)
      @patches.reorder('distance')
    end
    @patches ||= Patch
    @patches = @patches.where(
      filtered_params).includes(
        :user).paginate(page: params[:page],
                        per_page: 10)
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
