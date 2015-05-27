class StaticController < ApplicationController

  def index
    photos = HomepageImage.all.sample 30
    @photos = photos[0..13]
    @other_photos = photos[14..-1].map {|photo| 'url(' << photo.image.url(:medium) << ')' }
  end

  def about_us
  end

  def faq
  end

  def terms
  end

end
