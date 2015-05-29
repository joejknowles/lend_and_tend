class AddAttachmentImageToHomepageImages < ActiveRecord::Migration
  def self.up
    change_table :homepage_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :homepage_images, :image
  end
end
