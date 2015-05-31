require 'rails_helper'

feature 'Add a patch' do
  context 'when authenticated' do
    before do
      visit '/'
      join_with_email
    end

    scenario 'succeeds with acceptable details' do
      visit '/patches'
      click_link 'Add Patch'
      fill_in 'Location', with: 'EC4M 8AD'
      select 'Hanging basket', from: 'Space to offer'
      select '0-1 year', from: 'How long can you offer this space?'
      fill_in 'Description', with: 'Triangle shaped, overlooking river'
      click_button 'List my patch'
      expect(page).to have_content(
        'You have successfully added your Hanging basket')
    end

    scenario 'fails with location missing' do
      visit '/patches/new'
      select 'Hanging basket', from: 'Space to offer'
      select '0-1 year', from: 'How long can you offer this space?'
      click_button 'List my patch'
      expect(page).to have_content("Location can't be blank")
      expect(current_path).to eq '/patches/new'
    end

    scenario 'fails with invalid postcode location' do
      visit '/patches/new'
      fill_in 'Location', with: '6l gs nodhu pt a'
      select 'Hanging basket', from: 'Space to offer'
      select '0-1 year', from: 'How long can you offer this space?'
      click_button 'List my patch'
      expect(page).to have_content("Please enter a valid location")
      expect(current_path).to eq '/patches/new'
    end

    scenario 'add a patch with an image' do
      visit '/patches/new'
      select 'Hanging basket', from: 'Space to offer'
      select '0-1 year', from: 'How long can you offer this space?'
      fill_in 'Location', with: 'EC4M 8AD'
      attach_file 'Image', 'public/test.gif'
      click_button 'List my patch'
      expect(page).to have_css "img[src*='test.gif']"
    end

    scenario 'Can add multiple patches' do
      visit '/patches/new'
      select 'Hanging basket', from: 'Space to offer'
      select '0-1 year', from: 'How long can you offer this space?'
      fill_in 'Location', with: 'EC4M 8AD'
      click_button 'List my patch'
      visit '/patches/new'
      select 'Hanging basket', from: 'Space to offer'
      select '0-1 year', from: 'How long can you offer this space?'
      fill_in 'Location', with: 'YO10 3DD'
      click_button 'List my patch'
      expect(page).to have_content "EC4M 8AD"
      expect(page).to have_content "YO10 3DD"
    end
  end

  context 'when unauthenticated' do
    scenario 'redirects to the "Log in" page' do
      visit '/patches/new'
      expect(page).to have_content(
        'You need to sign in or sign up before continuing.')
      expect(current_path).to eq '/users/sign_in'
    end
  end
end
