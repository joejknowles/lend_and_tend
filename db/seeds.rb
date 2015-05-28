User.create(admin: true,
            name: 'admin',
            password: 'adminadmin',
            password_confirmation: 'adminadmin',
            email: 'admin@admin.com')

if Rails.env.development?
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
end

HomepageImage.create(
 created_at: "2015-05-27 09:57:30",
 updated_at: "2015-05-27 09:57:30",
 image_file_name: "026.jpg",
 image_content_type: "image/jpeg",
 image_file_size: 584918, image_updated_at: "2015-05-27 09:57:30")

HomepageImage.create(
 created_at: "2015-05-27 09:57:51",
 updated_at: "2015-05-27 09:57:51",
 image_file_name: "028.jpg",
 image_content_type: "image/jpeg",
 image_file_size: 512883,
 image_updated_at: "2015-05-27 09:57:50")

HomepageImage.create(created_at: "2015-05-27 09:58:13", updated_at: "2015-05-27 09:58:13", image_file_name: "040.jpg", image_content_type: "image/jpeg", image_file_size: 385182, image_updated_at: "2015-05-27 09:58:13")
HomepageImage.create(created_at: "2015-05-27 09:58:32", updated_at: "2015-05-27 09:58:32", image_file_name: "058.jpg", image_content_type: "image/jpeg", image_file_size: 381231, image_updated_at: "2015-05-27 09:58:31")
HomepageImage.create(created_at: "2015-05-27 09:58:45", updated_at: "2015-05-27 09:58:45", image_file_name: "060.jpg", image_content_type: "image/jpeg", image_file_size: 401267, image_updated_at: "2015-05-27 09:58:45")
HomepageImage.create(created_at: "2015-05-27 09:59:54", updated_at: "2015-05-27 09:59:54", image_file_name: "062.jpg", image_content_type: "image/jpeg", image_file_size: 272470, image_updated_at: "2015-05-27 09:59:53")
HomepageImage.create(created_at: "2015-05-27 10:00:17", updated_at: "2015-05-27 10:00:17", image_file_name: "063.jpg", image_content_type: "image/jpeg", image_file_size: 572000, image_updated_at: "2015-05-27 10:00:17")
HomepageImage.create(created_at: "2015-05-27 10:00:39", updated_at: "2015-05-27 10:00:39", image_file_name: "079.jpg", image_content_type: "image/jpeg", image_file_size: 934590, image_updated_at: "2015-05-27 10:00:38")
HomepageImage.create(created_at: "2015-05-27 10:01:13", updated_at: "2015-05-27 10:01:13", image_file_name: "150.jpg", image_content_type: "image/jpeg", image_file_size: 612431, image_updated_at: "2015-05-27 10:01:13")
HomepageImage.create(created_at: "2015-05-27 10:01:40", updated_at: "2015-05-27 10:01:40", image_file_name: "IMG_2846.jpg", image_content_type: "image/jpeg", image_file_size: 775910, image_updated_at: "2015-05-27 10:01:40")
HomepageImage.create(created_at: "2015-05-27 10:02:16", updated_at: "2015-05-27 10:02:16", image_file_name: "IMG_2853.jpg", image_content_type: "image/jpeg", image_file_size: 2486380, image_updated_at: "2015-05-27 10:02:15")
HomepageImage.create(created_at: "2015-05-27 10:03:14", updated_at: "2015-05-27 10:03:14", image_file_name: "IMG_2856.jpg", image_content_type: "image/jpeg", image_file_size: 2131208, image_updated_at: "2015-05-27 10:03:13")
HomepageImage.create(image_file_name: "IMG_6086.jpg", image_content_type: "image/jpeg", image_file_size: 2842422, image_updated_at: "2015-05-27 10:04:01")
HomepageImage.create(image_file_name: "IMG_6102.jpg", image_content_type: "image/jpeg", image_file_size: 1813970, image_updated_at: "2015-05-27 10:05:03")
HomepageImage.create(image_file_name: "IMG_7014.jpg", image_content_type: "image/jpeg", image_file_size: 1174039, image_updated_at: "2015-05-27 10:05:42")
HomepageImage.create(image_file_name: "IMG_7259.jpg", image_content_type: "image/jpeg", image_file_size: 2294067, image_updated_at: "2015-05-27 10:06:29")
HomepageImage.create(image_file_name: "IMG_7615.jpg", image_content_type: "image/jpeg", image_file_size: 2030257, image_updated_at: "2015-05-27 10:07:33")
HomepageImage.create(image_file_name: "IMG_7677.jpg", image_content_type: "image/jpeg", image_file_size: 297807, image_updated_at: "2015-05-27 10:08:47")
HomepageImage.create(image_file_name: "IMG_8176.jpg", image_content_type: "image/jpeg", image_file_size: 1161455, image_updated_at: "2015-05-27 10:09:21")
HomepageImage.create(image_file_name: "IMG_8177.jpg", image_content_type: "image/jpeg", image_file_size: 1331886, image_updated_at: "2015-05-27 10:09:50")
HomepageImage.create(image_file_name: "IMG_8359.jpg", image_content_type: "image/jpeg", image_file_size: 1803378, image_updated_at: "2015-05-27 10:10:46")
HomepageImage.create(image_file_name: "IMG_8896.jpg", image_content_type: "image/jpeg", image_file_size: 386025, image_updated_at: "2015-05-27 10:11:24")
HomepageImage.create(image_file_name: "IMG_9425.jpg", image_content_type: "image/jpeg", image_file_size: 124296, image_updated_at: "2015-05-27 10:11:44")
HomepageImage.create(image_file_name: "STA70829.jpg", image_content_type: "image/jpeg", image_file_size: 1889360, image_updated_at: "2015-05-27 10:12:00")

puts "Database successfully seeded"