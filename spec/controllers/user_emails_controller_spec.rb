require 'rails_helper'

RSpec.describe UserEmailsController, type: :controller do

  it 'sends an email when required' do
    allow(User).to receive(:find) { 1 }
    expect(UserMailer).to receive(:match_request)
    post :create, id: 1, user_id: 2
  end

end
