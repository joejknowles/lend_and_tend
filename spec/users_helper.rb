def join_with_email(name = 'The Tester',
                    email = 'testing@testing.test',
                    password = 'testtest')
  click_button 'Join In!'
  fill_in 'user[name]', with: name
  fill_in 'join_email', with: email
  fill_in 'join_password', with: password
  fill_in 'password_confirmation', with: password
  click_button 'Join in with Email'
  User.find_by(email: 'testing@testing.test' )
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

def join_and_login_admin
  User.create(name: 'Test',
              email: 'test@test.com',
              password: 'testtest',
              password_confirmation: 'testtest',
              admin: true)
  visit '/'
  click_button 'Log In!'
  fill_in 'login_email', with: 'test@test.com'
  fill_in 'login_password', with: 'testtest'
  click_button 'Log in'
end