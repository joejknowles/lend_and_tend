feature 'Each user has their own profile page' do
  scenario 'User adds patch, can see it on their profile' do
    join_and_add_patch
    visit '/patches'
    click_link 'The Tester'
    expect(page).to have_content 'Space available: Hanging basket'
    expect(page).to have_content 'The Tester'
    expect(page).to have_content 'testing@testing.test'
  end

  scenario 'can add a about me' do
    join_and_add_patch
    visit '/'
    click_link 'My profile'
    click_link 'Edit profile'
    fill_in 'About me', with: "I'm testing lend and tend!"
    click_button 'Save profile'
    expect(page).to have_content "I'm testing lend and tend!"
  end


end