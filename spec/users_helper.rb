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

def join_and_add_patch
  visit '/'
  join_with_email
  visit '/patches/new'
  fill_in 'Location', with: 'EC4M 8AD'
  select 'Hanging basket', from: 'What sort of space would you like to offer?'
  select '0-1 year', from: 'How long can you offer this space?'
  fill_in 'Description', with: 'Triangle shaped, overlooking river'
  click_button 'List my patch'
end