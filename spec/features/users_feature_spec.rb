require 'rails_helper'

feature 'User Management' do

  context 'User is not signed in' do

    it 'should see "Join with Email" link' do
      visit '/'
      expect(page).to have_link 'Join with Email'
    end

    it 'should see "Log in" link' do
      visit '/'
      expect(page).to have_link 'Log in'
    end

    it 'should not see "Log out" link' do
      visit '/'
      expect(page).not_to have_link 'Log out'
    end

    it 'should not see "My profile" link' do
      visit '/'
      expect(page).not_to have_link 'My profile'
    end

  end


  context 'User is signed in' do

    before do
      visit '/'
      join_with_email
    end

    it 'should not see "Join with Email" link' do
      visit '/'
      expect(page).not_to have_link 'Join with Email'
    end

    it 'should not see "Log in" link' do
      visit '/'
      expect(page).not_to have_link 'Log in'
    end

    it 'should see "Log out" link' do
      visit '/'
      expect(page).to have_link 'Log out'
    end

    it 'should see "My profile" link' do
      visit '/'
      expect(page).to have_link 'My profile'
    end

  end

  context 'Facebook user management' do

    before do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new provider: 'facebook', uid: '12345', info: { name: 'Tester', email: 'test@test.com', image: 'http://image.images.com' }
    end

    it 'when logged out can see "Join with Facebook" link' do
      visit '/'
      expect(page).to have_content 'Join with Facebook'
    end

    it 'can login with facebook' do
      visit '/'
      click_link 'Join with Facebook'
      expect(page).to have_content 'Successfully authenticated from Facebook account.'
    end

    it 'when logged in cannot see "Join"/"Log in" links' do
      visit '/'
      click_link 'Join with Facebook'
      expect(page).not_to have_content 'Join with Facebook'
      expect(page).not_to have_content 'Join with Email'
      expect(page).not_to have_content 'Log in'
    end

    it 'can logout' do
      visit '/'
      click_link 'Join with Facebook'
      click_link 'Log out'
      expect(page).to have_content 'Signed out successfully.'
    end

  end

  context 'User sign up' do
    it 'user is asked for name when signing up by email' do
      visit '/'
      click_link 'Join with Email'
      fill_in 'Name', with: 'The Tester'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'supersecret'
      fill_in 'Password confirmation', with: 'supersecret'
      click_button 'Join'
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
  end
end