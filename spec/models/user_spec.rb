require 'rails_helper'

RSpec.describe User, type: :model do
  it 'saves user details from Facebook to local database' do
    fb_user_mock = double()
    allow(fb_user_mock).to receive_message_chain(:info, :name) { 'Tester' }
    fb_user_mock.stub_chain(:info, :email) { 'test@test.com' }
    fb_user_mock.stub(:uid) { '12345' }
    fb_user_mock.stub_chain(:info, :image) { 'http://test.image.com' }
    fb_user_mock.stub(:provider) { 'facebook' }

    User.from_omniauth(fb_user_mock)
    user = User.find_by(email: 'test@test.com')
    expect(user.name).to eq 'Tester'
    expect(user.uid).to eq '12345'
    expect(user.email).to eq 'test@test.com'
    expect(user.image).to eq 'http://test.image.com'
    expect(user.provider).to eq 'facebook'
  end
end
