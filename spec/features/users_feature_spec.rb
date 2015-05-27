require 'rails_helper'

feature 'User Management' do

  context 'User is not signed in' do

    scenario 'should see "Join with Email" link' do
      visit '/'
      expect(page).to have_button 'Join In!'
    end

    scenario 'should see "Log in" link' do
      visit '/'
      expect(page).to have_button 'Log In!'
    end

    scenario 'should not see "Log out" link' do
      visit '/'
      expect(page).not_to have_link 'Log out'
    end

    scenario 'should not see "My profile" link' do
      visit '/'
      expect(page).not_to have_link 'My profile'
    end

  end


  context 'User is signed in' do

    before do
      visit '/'
      join_with_email
    end

    scenario 'should not see "Join with Email" link' do
      visit '/'
      expect(page).not_to have_link 'Join with Email'
    end

    scenario 'should not see "Log in" link' do
      visit '/'
      expect(page).not_to have_link 'Log in'
    end

    scenario 'should see "Log out" link' do
      visit '/'
      expect(page).to have_link 'Log out'
    end

    scenario 'should see "My profile" link' do
      visit '/'
      expect(page).to have_link 'My profile'
    end

  end

  context 'Facebook user management' do

    before do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new provider: 'facebook', uid: '12345', info: { name: 'Tester', email: 'test@test.com', image: 'http://image.images.com' }
    end

    scenario 'when logged out can see "Join with Facebook" link' do
      visit '/'
      click_button 'Join In!'
      expect(page).to have_selector '#fb_btn'
    end

    scenario 'can login with facebook' do
      visit '/'
      click_button 'Join In!'
      click_button'Join in with Facebook'
      expect(page).to have_content 'You were successfully authenticated using Facebook'
    end

    scenario 'when logged in cannot see "Join"/"Log in" links' do
      visit '/'
      click_button 'Join In!'
      click_button 'Join in with Facebook'
      expect(page).not_to have_content 'Join with Facebook'
      expect(page).not_to have_content 'Join with Email'
      expect(page).not_to have_content 'Log in'
    end

    scenario 'can logout' do
      visit '/'
      click_button 'Join In!'
      click_button 'Join in with Facebook'
      click_link 'Log out'
      expect(page).to have_content 'Signed out successfully.'
    end
  end

  context 'User sign up' do
    scenario 'user is asked for name when signing up by email' do
      visit '/'
      click_button 'Join In!'
      fill_in 'user_name', with: 'The Tester'
      fill_in 'join_email', with: 'test@test.com'
      fill_in 'join_password', with: 'supersecret'
      fill_in 'password_confirmation', with: 'supersecret'
      click_button 'Join in with Email'
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
  end
end
