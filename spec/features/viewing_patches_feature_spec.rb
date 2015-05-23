require 'rails_helper'

feature 'To view available patches' do
  def add_patch(location = 'EC4M 8AD',
                patch_type = 'Window sill',
                duration = '1')
    user = User.first_or_create(name: 'Mr Tester', email: 'email@for.contact', password: 'secretpassword', password_confirmation: 'secretpassword')
    Patch.create(location: location, patch_type: patch_type, duration: duration, user_id: user.id)
  end

  context 'authenticated user' do
    before do
      add_patch('EC4M 8AD', 'Window sill', '1')
      add_patch('EH15 9PO', 'Window sill', '2')
      add_patch('SW11 4AE', 'Front garden', '1')
      add_patch('ND2 7LM', 'Roof garden', '2')
      visit '/'
      join_with_email
    end

    scenario 'views all advertised patches' do
      visit '/patches'
      expect(page).to have_content 'EC4M 8AD'
      expect(page).to have_content 'Window sill'
      expect(page).to have_content '1'
    end

    scenario 'applies filter to see only particular type' do
      visit '/patches'
      select 'Front garden', from: 'Patch type'
      click_button 'Filter'
      expect(page).to have_content 'SW11 4AE'
      expect(page).not_to have_content 'EC4M 8AD'
      expect(page).not_to have_content 'ND2 7LM'
    end

    scenario 'applies project duration filter' do
      visit '/patches'
      select '1-2 year', from: 'Duration'
      click_button 'Filter'
      expect(page).not_to have_content 'SW11 4AE'
      expect(page).not_to have_content 'EC4M 8AD'
      expect(page).to have_content 'ND2 7LM'
    end

    scenario 'applies multiple filters at the same time' do
      visit '/patches'
      select 'Window sill', from: 'Patch type'
      select '1-2 year', from: 'Duration'
      click_button 'Filter'
      expect(page).to have_content 'EH15 9PO'
      expect(page).not_to have_content 'SW11 4AE'
      expect(page).not_to have_content 'EC4M 8AD'
      expect(page).not_to have_content 'ND2 7LM'
    end
  end

  scenario 'unauthenticated user is redirected to log in page' do
    visit '/patches'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
    expect(current_path).to eq '/users/sign_in'
  end
end