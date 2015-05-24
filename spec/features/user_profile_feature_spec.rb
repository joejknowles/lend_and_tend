feature 'Each user has their own profile page' do

  scenario 'User adds patch, can see it on their profile' do
    join_and_add_patch
    visit '/patches'
    click_link 'The Tester'
    expect(page).to have_content 'Space available: Hanging basket'
    expect(page).to have_content 'The Tester'
    expect(page).to have_content 'testing@testing.test'
  end

  scenario 'User adds patch with further description, can see it on their profile' do
    join_and_add_patch
    visit '/patches'
    click_link 'The Tester'
    expect(page).to have_content 'Triangle shaped, overlooking river'
  end

  scenario 'User has no patches, sees "This user has no patches to share"' do
    visit '/'
    join_with_email
    click_link 'My profile'
    expect(page).to have_content 'You are not offering any patches yet'
  end

  scenario 'can add a about me' do
    visit '/'
    join_with_email
    click_link 'My profile'
    click_link 'Edit profile'
    fill_in 'About me', with: "I'm testing lend and tend!"
    click_button 'Save profile'
    expect(page).to have_content "I'm testing lend and tend!"
  end

  scenario 'is encouraged to fill in their profile after signup' do
    visit '/'
    user = join_with_email
    expect(page).to have_content 'Your profile is empty. To get the most out of Lend & Tend please take a moment to add to your profile:'
    expect(current_path).to eq "/users/#{user.id}"
  end
end