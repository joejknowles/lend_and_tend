require 'rails_helper'

feature 'can upload an image' do

  scenario 'can upload image' do
    visit '/'
    join_with_email
    visit '/homepage_images'
    click_link 'Add new image to the homepage'
    attach_file 'Image', 'public/test.gif'
    click_button 'Add photo'
    expect(current_path).to eq '/homepage_images'
    expect(page).to have_css("img[src*='test.gif']")
  end
end