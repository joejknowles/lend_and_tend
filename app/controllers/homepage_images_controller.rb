class HomepageImagesController < ApplicationController

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

  def image_from_params
    params.require(:homepage_image).permit(:image)
  end

  def destroy
    HomepageImage.destroy params[:id]
    redirect_to homepage_images_path, notice: 'Photo removed!'
  end

end
