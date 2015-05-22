require 'rails_helper'

feature 'Admin can add homepage images to database' do

  scenario 'can upload image' do
    join_and_login_admin
    visit '/homepage_images'
    click_link 'Add new image to the homepage'
    attach_file 'Image', 'public/test.gif'
    click_button 'Add photo'
    expect(current_path).to eq '/homepage_images'
    expect(page).to have_css("img[src*='test.gif']")
  end

  scenario 'Can remove image' do
    join_and_login_admin
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

  scenario 'none admin users cannot access homepage_images' do
    visit '/'
    join_with_email
    visit '/homepage_images'
    expect(current_path).to eq '/'
  end

  scenario 'logged out users cannot access homepage_images' do
    visit '/homepage_images'
    expect(current_path).to eq '/users/sign_in'
  end
end