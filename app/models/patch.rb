class Patch < ActiveRecord::Base
  belongs_to :user
  geocoded_by :location
  after_validation :geocode, if: :location_changed?

  validates_presence_of :location
  validates_presence_of :patch_type
  validates_presence_of :duration

  scope :filtered_by_type, lambda { |patch_type| where patch_type: patch_type }
  scope :filtered_by_duration, lambda { |duration| where duration: duration }
end
