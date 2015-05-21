def join_with_email(name = 'The Tester',
                    email = 'testing@testing.test',
                    password = 'testtest')
  click_link 'Join with Email'
  fill_in 'Name', with: name
  fill_in 'Email', with: email
  fill_in 'Password', with: password
  fill_in 'Password confirmation', with: password
  click_button 'Join'
end