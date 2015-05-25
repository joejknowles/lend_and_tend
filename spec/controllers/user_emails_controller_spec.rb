require 'rails_helper'

RSpec.describe UserEmailsController, type: :controller do

  it 'sends an email when required' do
    allow(User).to receive(:find) { 1 }
    allow(controller).to receive(:current_user) { 2 }
    expect(UserMailer).to receive_message_chain(:match_request, :deliver_now)
    post :create, user_id: 2
  end

end
