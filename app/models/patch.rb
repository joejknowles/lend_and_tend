class Patch < ActiveRecord::Base

  belongs_to :user

  validates_presence_of :location
  validates_presence_of :patch_type
  validates_presence_of :duration

  scope :filtered_by_type, -> (patch_type) { where patch_type: patch_type }
  scope :filtered_by_duration, -> (duration) { where duration: duration }

end
