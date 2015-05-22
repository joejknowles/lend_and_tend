require 'rails_helper'

feature 'Admin can change homepage images' do

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

  scenario 'can remove image' do
    visit '/'
    join_with_email
    visit '/homepage_images'
    click_link 'Add new image to the homepage'
    attach_file 'Image', 'public/test.gif'
    click_button 'Add photo'
    expect(page).to have_css("img[src*='test.gif']")
    click_link 'Remove photo'
    expect(current_path).to eq '/homepage_images'
    expect(page).not_to have_css("img[src*='test.gif']")
    expect(page).to have_content 'Photo removed!'
  end

  xscenario 'none admin users cannot access homepage_images' do

  end
end