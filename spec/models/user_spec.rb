require 'rails_helper'

RSpec.describe User, type: :model do
  it { is_expected.to have_db_column(:name) }
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to have_db_column(:about_me) }
  it { is_expected.to have_many(:patches) }
  it { is_expected.to have_db_column(:admin) }

  it 'admin column defaults to false on creation' do
    user = described_class.new(name: 'Test',
                               email: 'test@test.com',
                               password: 'testtest',
                               password_confirmation: 'testtest')
    user.save
    expect(user.admin).to be false
  end
end
