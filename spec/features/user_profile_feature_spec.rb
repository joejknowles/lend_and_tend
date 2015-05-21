feature 'Each user has their own profile page' do
  scenario 'User adds patch, can see it on their profile' do
    visit '/'
    join_with_email
    visit '/patches/new'
    fill_in 'Location', with: 'EC4M 8AD'
    select 'Hanging basket', from: 'What sort of space would you like to offer?'
    select '0-1 year', from: 'How long can you offer this space?'
    click_button 'List my patch'
    visit '/patches'
    click_link 'The Tester'
    expect(page).to have_content 'Space available: Hanging basket'
    expect(page).to have_content 'The Tester'
  end
end