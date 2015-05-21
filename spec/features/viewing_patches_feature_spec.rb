require 'rails_helper'

feature 'View available patches' do
  def add_patch(location = 'EC4M 8AD',
                patch_type = 'Window sill',
                duration = '1')
    Patch.create(location: location, patch_type: patch_type, duration: duration)
  end

  before do
    add_patch
  end

  scenario 'authenticated user views all advertised patches' do
    visit '/'
    join_with_email
    visit '/patches'
    expect(page).to have_content 'EC4M 8AD'
    expect(page).to have_content 'Window sill'
    expect(page).to have_content '1'
  end

  scenario 'unauthenticated user is redirected to log in page' do
    visit '/patches'
    expect(page).to have_content 'You need to sign in or sign up before continuing.'
    expect(current_path).to eq '/users/sign_in'
  end
end