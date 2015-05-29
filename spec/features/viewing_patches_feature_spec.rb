require 'rails_helper'

feature 'To view available patches' do
  def add_patch(location = 'EC4M 8AD',
                patch_type = 'Windowsill',
                duration = '1')
    user = User.first_or_create(
      name: 'Mr Tester', email: 'email@for.contact',
      password: 'secretpassword', password_confirmation: 'secretpassword')
    Patch.create(
      location: location, patch_type: patch_type,
      duration: duration, user_id: user.id)
  end

  context 'authenticated user' do
    before do
      add_patch('EC4M 8AD', 'Windowsill', '1') # London
      add_patch('EH11 2AB', 'Windowsill', '2') # Edinburgh
      add_patch('SW11 4AE', 'Front garden', '1') # London
      add_patch('YO10 3DD', 'Roof garden', '2') # York
      visit '/'
      join_with_email
    end

    scenario 'views all advertised patches' do
      visit '/patches'
      expect(page).to have_content 'EC4M 8AD'
      expect(page).to have_content 'Windowsill'
      expect(page).to have_content '1'
      expect(page).to have_content 'available'
    end

    scenario 'applies filter to see only particular type' do
      visit '/patches'
      select 'Front garden', from: 'Patch type'
      click_button 'Find patch'
      expect(page).to have_content 'SW11 4AE'
      expect(page).not_to have_content 'EC4M 8AD'
      expect(page).not_to have_content 'YO10 3DD'
    end

    scenario 'applies project duration filter' do
      visit '/patches'
      select '1-2 year', from: 'Duration'
      click_button 'Find patch'
      expect(page).not_to have_content 'SW11 4AE'
      expect(page).not_to have_content 'EC4M 8AD'
      expect(page).to have_content 'YO10 3DD'
    end

    scenario 'applies multiple filters at the same time' do
      visit '/patches'
      select 'Windowsill', from: 'Patch type'
      select '1-2 year', from: 'Duration'
      click_button 'Find patch'
      expect(page).to have_content 'EH11 2AB'
      expect(page).not_to have_content 'SW11 4AE'
      expect(page).not_to have_content 'EC4M 8AD'
      expect(page).not_to have_content 'YO10 3DD'
    end

    context 'geocoder enabled' do
      scenario 'filters results by distance' do
        visit '/patches'
        fill_in 'Location', with: 'London'
        click_button 'Find patch'
        expect(page).not_to have_content 'EH11 2AB'
        expect(page).to have_content 'SW11 4AE'
        expect(page).to have_content 'EC4M 8AD'
        expect(page).not_to have_content 'YO10 3DD'
      end
    end

    scenario 'sees paginated results' do
      7.times { add_patch('EC4M 8AD', 'Windowsill', '1') }
      visit '/patches'
      expect(page).to have_css("li[class='row listed-patch']", count: 10)
    end
  end

  scenario 'unauthenticated user is redirected to log in page' do
    visit '/patches'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
    expect(current_path).to eq '/users/sign_in'
  end
end
