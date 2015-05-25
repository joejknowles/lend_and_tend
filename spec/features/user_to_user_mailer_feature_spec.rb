feature 'Users can mail other users' do

  before do
    create_two_users('Jack','Jill')
  end

  scenario 'Sees link to mail other user' do
    user = User.find_by email: 'test2@test2.com'
    visit "/users/#{user.id}"
    expect(page).to have_button 'Match? Get in touch!'
  end

  scenario 'does not see link to mail self' do
    click_link 'My profile'
    expect(page).not_to have_button 'Match? Get in touch!'
  end

  scenario 'first user can mail second' do
    user = User.find_by email: 'test2@test2.com'
    visit "/users/#{user.id}"
    click_button 'Match? Get in touch!'
    fill_in 'Your message', with: 'Hi, user two, can we patch match?'
    expect { click_button 'Send message' }.to change{ ActionMailer::Base.deliveries.count }.by 1
    expect(page).to have_content 'Message sent!'
  end
end
