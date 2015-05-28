# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  def patch_match_alert
    user = User.create( id: 1,
                name: 'Mr Test',
                email: 'test@test.com',
                password: 'testtest',
                password_confirmation: 'testtest')
    user2 = User.create( id: 2,
                name: 'Mrs Test',
                email: 'test2@test2.com',
                password: 'test2test2',
                password_confirmation: 'test2test2')
    UserMailer.match_request(user, user2, 'HELLO JOESEPGHFHFJFJ')
  end

end
