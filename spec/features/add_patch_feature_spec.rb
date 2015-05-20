require 'rails_helper'

feature 'Add a patch' do
  scenario 'with acceptable details' do
    visit '/patches/new'
    fill_in 'Location', with: 'EC4M 8AD'
    fill_in 'Size', with: 'small'
    fill_in 'Duration', with: '1'
    click_button 'Add'
    expect(page).to have_content(
      "You have successfully added your small patch.")
  end
  scenario 'with location missing' do
    visit '/patches/new'
    fill_in 'Size', with: 'small'
    fill_in 'Duration', with: '1'
    click_button 'Add'
    expect(page).to have_content("Location can't be blank")
    expect(current_path).to eq '/patches/new'
  end
  scenario 'with invalid postcode' do
    visit '/patches/new'
    fill_in 'Location', with: 'E2C4M 8A'
    fill_in 'Size', with: 'small'
    fill_in 'Duration', with: '1'
    click_button 'Add'
    expect(page).to have_content("Invalid postcode")
    expect(current_path).to eq '/patches/new'
  end
  scenario 'with size missing' do
    visit '/patches/new'
    fill_in 'Location', with: 'WF12 7ED'
    fill_in 'Duration', with: '1'
    click_button 'Add'
    expect(page).to have_content("Size can't be blank")
    expect(current_path).to eq '/patches/new'
  end
  scenario 'with location missing' do
    visit '/patches/new'
    fill_in 'Size', with: 'small'
    fill_in 'Location', with: 'WF17 8AC'
    click_button 'Add'
    expect(page).to have_content("Duration can't be blank")
    expect(current_path).to eq '/patches/new'
  end
end