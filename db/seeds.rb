require './app/helpers/patches_helper'

include PatchesHelper

User.create(admin: true,
            name: 'admin',
            password: 'adminadmin',
            password_confirmation: 'adminadmin',
            email: 'admin@admin.com')

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

HomepageImage.create(
    image_file_name: "026.jpg",
    image_content_type: "image/jpeg",
    image_file_size: 584918,
    image_updated_at: "2015-05-26 11:23:11")

HomepageImage.create(image_file_name: "028.jpg", image_content_type: "image/jpeg", image_file_size: 512883, image_updated_at: "2015-05-26 11:44:33")

HomepageImage.create(image_file_name: "040.jpg", image_content_type: "image/jpeg", image_file_size: 385182, image_updated_at: "2015-05-26 11:44:54")

HomepageImage.create(image_file_name: "058.jpg", image_content_type: "image/jpeg", image_file_size: 381231, image_updated_at: "2015-05-26 11:45:11")

HomepageImage.create(image_file_name: "059.jpg", image_content_type: "image/jpeg", image_file_size: 425269, image_updated_at: "2015-05-26 11:46:20")

HomepageImage.create(image_file_name: "060.jpg", image_content_type: "image/jpeg", image_file_size: 401267, image_updated_at: "2015-05-26 11:46:41")

HomepageImage.create(id: 8, image_file_name: "063.jpg", image_content_type: "image/jpeg", image_file_size: 572000, image_updated_at: "2015-05-26 11:47:18")

HomepageImage.create(id: 10, image_file_name: "064.jpg", image_content_type: "image/jpeg", image_file_size: 589498, image_updated_at: "2015-05-26 11:48:00")

HomepageImage.create(id: 12, image_file_name: "079.jpg", image_content_type: "image/jpeg", image_file_size: 934590, image_updated_at: "2015-05-26 11:49:07")

HomepageImage.create(id: 13,    image_file_name: "150.jpg",image_content_type: "image/jpeg",  image_file_size: 612431, image_updated_at: "2015-05-26 11:49:35")

HomepageImage.create(id: 14, image_file_name: "IMG_2846.jpg", image_content_type: "image/jpeg", image_file_size: 775910, image_updated_at: "2015-05-26 11:49:55")
HomepageImage.create(id: 15, image_file_name: "IMG_2853.jpg", image_content_type: "image/jpeg", image_file_size: 2486380, image_updated_at: "2015-05-26 11:50:23")
HomepageImage.create(id: 16, image_file_name: "IMG_6086.jpg", image_content_type: "image/jpeg", image_file_size: 2842422, image_updated_at: "2015-05-26 11:51:11")
HomepageImage.create(id: 17, image_file_name: "IMG_7259.jpg", image_content_type: "image/jpeg", image_file_size: 2294067, image_updated_at: "2015-05-26 11:52:19")

puts "Database successfully seeded"