require "rails_helper"

RSpec.describe UserMailer, type: :mailer do

    let(:user_to) { mock_model User, name: 'Ms Test', email: 'MsTest@test.com' }

    let(:user_from) { mock_model User, name: 'Mr Test', email: 'MrTest@test.com' }

    let(:email) { UserMailer.match_request(user_to, user_from, 'Hi!') }

    it 'has a relevant subject line' do
      expect(email.subject).to eq "Can we patch match please?"
    end

    it 'is sent to correct user' do
      expect(email.to.first).to eq user_to.email
    end

    it 'the reply to address is the user sending the messages email' do
      expect(email.reply_to.first).to eq user_from.email
    end

    it 'is sent with correct message' do
      expect(email.body.raw_source).to include 'Hi!'
    end

    it 'contains a note to say which user has sent the message and how to reply' do
      expect(email.body.raw_source).to include "has requested we send you the below message:"

      expect(email.body.raw_source).to include "To reply to your patch match, just \n<a href=\"mailto:MrTest@test.com\">reply to this email</a>\n. If you found this email offensive, please be sure to let us know at:\n<a href=\"mailto:garden.guardianship@gmail.com\">garden.guardianship@gmail.com</a>\n</p>\n\n</body>\n</hmtl>\n"
    end

    it 'is sent from clients email address' do
      expect(email.from.first).to eq 'lendandtendnoreply@gmail.com'
    end

end
