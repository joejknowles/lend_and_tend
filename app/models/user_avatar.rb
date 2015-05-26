class UserAvatar < ActiveRecord::Base
  belongs_to :user
  has_attached_file :image, styles: { medium: '250x250', thumb: '100x100' }, default_url: 'http://placehold.it/250x250'

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
