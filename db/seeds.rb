require './app/helpers/patches_helper'

include PatchesHelper

users = %w(Bob Fred Jess Nora Richard)
users = users.inject([]) do |list, name|
  list << User.create(name: name,
                      email: "#{name}@test.com",
                      password: 'testtest',
                      password_confirmation: 'testtest')
end
locations = [
  'YO10 3DD',
  'WF12 7ED',
  'ML8 5ST',
  'DL17 0LP',
  'LL24 0EW',
  'SA35 0BG',
  'SN14 6JP',
  'B21 8AS'
]
patch_types_list.each do |type|
  users.each do |user|
    Patch.create(patch_type: type,
                 user: user,
                 location: locations.sample,
                 duration: 1)
  end
end

puts "Database successfully seeded"