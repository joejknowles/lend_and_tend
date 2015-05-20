require 'rails_helper'

feature 'User Managament' do

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

  end
end