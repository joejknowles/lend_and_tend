class Patch < ActiveRecord::Base
  validates_presence_of :location
  validates_presence_of :patch_type
  validates_presence_of :duration

  belongs_to :user
end
