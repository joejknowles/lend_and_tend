require 'rails_helper'

feature 'Add a patch' do
  scenario 'new patch page' do
    visit '/patches/new'
    fill_in 'Location', with: 'EC4M 8AD'
    fill_in 'Size', with: 'small'
    fill_in 'Duration', with: '1'
    click_button 'Add'
    expect(page).to have_content("You have successfully added your small patch.")
  end
end