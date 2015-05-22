class HomepageImagesController < ApplicationController
  before_action :authenticate_user!, :check_admin

  def index
    @images = HomepageImage.all
  end

  def new
    @homepage_image = HomepageImage.new
  end

  def create
    HomepageImage.create(image_from_params)
    redirect_to homepage_images_path
  end

  def destroy
    HomepageImage.destroy params[:id]
    redirect_to homepage_images_path, notice: 'Photo removed!'
  end

  private

  def image_from_params
    params.require(:homepage_image).permit(:image)
  end

  def check_admin
    redirect_to '/' unless current_user.admin
  end

end
