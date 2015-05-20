class Patch < ActiveRecord::Base
  validates_presence_of :location
  validates_presence_of :size
  validates_presence_of :duration
  validates :location, postcode: true
end
