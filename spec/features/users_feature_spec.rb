require 'rails_helper'

feature 'User Management' do

  context 'User is not signed in' do

    scenario 'should see "Join with Email" link' do
      visit '/'
      expect(page).to have_button 'Join up'
    end

    scenario 'should see "launchloginmodal" link' do
      visit '/'
      expect(page).to have_button 'launchloginmodal'
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
      @user = join_with_email
    end

    scenario 'should not see "Join with Email" link' do
      visit '/'
      expect(page).not_to have_link 'Join with Email'
    end

    scenario 'should not see "launchloginmodal" link' do
      visit '/'
      expect(page).not_to have_link 'launchloginmodal'
    end

    scenario 'should see "Log out" link' do
      visit '/patches'
      expect(page).to have_link 'Log out'
    end

    scenario 'should see "My profile" link' do
      visit '/patches'
      expect(page).to have_link 'My profile'
    end

    scenario 'and deletes their account' do
      visit "/users/#{@user.id}"
      click_button 'Add to my profile'
      click_link 'delete my account'
      expect(page).to have_content 'Bye! Your account has been successfully cancelled. We hope to see you again soon.'
    end

  end

  context 'Facebook user management' do

    before do
      OmniAuth.config.test_mode = true
      OmniAuth.config.mock_auth[:facebook] = OmniAuth::AuthHash.new provider: 'facebook', uid: '12345', info: { name: 'Tester', email: 'test@test.com', image: 'https://placekitten.com/g/200/300' }
    end

    scenario 'when logged out can see "Join with Facebook" link' do
      visit '/'
      click_button 'Join up'
      expect(page).to have_selector '#fb_btn'
    end

    scenario 'can login with facebook' do
      visit '/'
      click_button 'Join up'
      click_button'Join in with Facebook'
      expect(page).to have_content 'You were successfully authenticated using Facebook'
    end

    scenario 'can login with facebook' do
      visit '/'
      click_button 'Join up'
      click_button'Join in with Facebook'
      expect(page).to have_css("img[src*='/g/200/300']")
    end

    scenario 'when logged in cannot see "Join"/"launchloginmodal" links' do
      visit '/'
      click_button 'Join up'
      click_button 'Join in with Facebook'
      expect(page).not_to have_content 'Join with Facebook'
      expect(page).not_to have_content 'Join with Email'
      expect(page).not_to have_content 'launchloginmodal'
    end

    scenario 'can logout' do
      visit '/'
      click_button 'Join up'
      click_button 'Join in with Facebook'
      click_link 'Log out'
      expect(page).to have_content 'Signed out successfully.'
    end
  end

  context 'User sign up' do
    scenario 'user is asked for name when signing up by email' do
      visit '/'
      click_button 'Join up'
      fill_in 'user_name', with: 'The Tester'
      fill_in 'join_email', with: 'test@test.com'
      fill_in 'join_password', with: 'supersecret'
      fill_in 'password_confirmation', with: 'supersecret'
      click_button 'Join in with Email'
      expect(page).to have_content 'Welcome! You have signed up successfully.'
    end
  end
end
