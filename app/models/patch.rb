class Patch < ActiveRecord::Base
  validates_presence_of :location
  validates_presence_of :patch_type
  validates_presence_of :duration

  scope :filtered_by_type, -> (patch_type) { where patch_type: patch_type }
end
