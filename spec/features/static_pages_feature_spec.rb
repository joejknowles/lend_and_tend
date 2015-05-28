require 'rails_helper'

feature 'Static Pages' do

  it 'shows the homepage as root' do
    visit '/'
    expect(page).to have_selector('.photo_wall')
  end

  it 'has a "About us" page' do
    visit '/about_us'
    expect(page).to have_content 'About us'
  end

  it 'has an "FAQ" page' do
    visit '/faq'
    expect(page).to have_content 'Frequently Asked Questions'
  end

  it 'has an "Terms and Conditions" page' do
    visit '/terms'
    expect(page).to have_content 'Please care for us, as we grow!'
  end

end
