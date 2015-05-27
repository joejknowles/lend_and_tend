class AddAttachmentImageToUserAvatars < ActiveRecord::Migration
  def self.up
    change_table :user_avatars do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :user_avatars, :image
  end
end
