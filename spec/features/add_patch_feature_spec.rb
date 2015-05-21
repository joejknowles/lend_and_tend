require 'rails_helper'

feature 'Add a patch' do
  context 'when authenticated' do
    before do
      visit '/'
      join_with_email
    end

    scenario 'succeeds with acceptable details' do
      visit '/patches/new'
      fill_in 'Location', with: 'EC4M 8AD'
      select 'Hanging basket', from: 'What sort of space would you like to offer?'
      select '0-1 year', from: 'How long can you offer this space?'
      click_button 'List my patch'
      expect(page).to have_content(
        'You have successfully added your Hanging basket')
    end

    scenario 'fails with location missing' do
      visit '/patches/new'
      select 'Hanging basket', from: 'What sort of space would you like to offer?'
      select '0-1 year', from: 'How long can you offer this space?'
      click_button 'List my patch'
      expect(page).to have_content("Location can't be blank")
      expect(current_path).to eq '/patches/new'
    end

    xscenario 'validates postcode is correct' do

    end
  end

  context 'when unauthenticated' do
    scenario 'redirects to the "Log in" page' do
      visit '/patches/new'
      expect(page).to have_content 'You need to sign in or sign up before continuing.'
      expect(current_path).to eq '/users/sign_in'
    end
  end
end