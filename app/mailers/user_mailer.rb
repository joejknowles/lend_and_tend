class UserMailer < ApplicationMailer

  def match_request(user_to, user_from, message)
      @user_message = message
      mail(subject: 'Can we patch match please?', to: user_to.email, reply_to: user_from.email, from: 'garden.guardianship@gmail.com')
  end
end
