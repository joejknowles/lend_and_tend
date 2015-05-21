require 'rails_helper'

feature 'View available patches' do
  def add_patch(location = 'EC4M 8AD',
                size = 'decent',
                duration = '1')
    Patch.create(location: location, size: size, duration: duration)
  end

  before do
    add_patch('SW11 3AX', 'small', '15')
  end

  scenario 'authenticated user views all advertised patches' do
    visit '/'
    join_with_email
    visit '/patches'
    expect(page).to have_content 'SW11 3AX'
    expect(page).to have_content 'small'
    expect(page).to have_content '15'
  end

  scenario 'unauthenticated user is redirected to log in page' do
    visit '/patches'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
    expect(current_path).to eq '/users/sign_in'
  end
end