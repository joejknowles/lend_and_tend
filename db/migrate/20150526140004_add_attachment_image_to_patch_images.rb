class AddAttachmentImageToPatchImages < ActiveRecord::Migration
  def self.up
    change_table :patch_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :patch_images, :image
  end
end
