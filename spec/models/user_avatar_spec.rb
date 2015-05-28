require 'rails_helper'

RSpec.describe UserAvatar, type: :model do
  it { is_expected.to belong_to(:user) }

  it { is_expected.to have_attached_file(:image) }

  it 'validates image file type' do
    expect(subject).to validate_attachment_content_type(:image)
      .allowing('image/png', 'image/gif', 'image/jpg', 'image/jpeg')
      .rejecting('text/plain', 'text/xml')
  end
end
