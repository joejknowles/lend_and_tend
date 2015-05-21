require 'rails_helper'

feature 'Add a patch' do
  scenario 'succeeds with acceptable details' do
    visit '/patches/new'
    fill_in 'Location', with: 'EC4M 8AD'
    select 'Hanging basket', from: 'What sort of space would you like to offer?'
    select '0-1 year', from: 'How long can you offer this space?'
    click_button 'List my patch'
    expect(page).to have_content(
      'You have successfully added your Hanging basket')
  end

  scenario 'fails with location missing' do
    visit '/patches/new'
    select 'Hanging basket', from: 'What sort of space would you like to offer?'
    select '0-1 year', from: 'How long can you offer this space?'
    click_button 'List my patch'
    expect(page).to have_content("Location can't be blank")
    expect(current_path).to eq '/patches/new'
  end

  xscenario 'validates postcode is correct' do
  end
end