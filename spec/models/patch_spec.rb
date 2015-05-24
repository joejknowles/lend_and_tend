require 'spec_helper'

describe Patch, type: :model do
  it { is_expected.to have_db_column(:location) }
  it { is_expected.to validate_presence_of(:location) }

  it { is_expected.to have_db_column(:patch_type) }
  it { is_expected.to validate_presence_of(:patch_type) }

  it { is_expected.to have_db_column(:duration) }
  it { is_expected.to validate_presence_of(:duration) }

  it { is_expected.to have_db_column(:description) }

  it { is_expected.to have_db_column(:latitude) }
  it { is_expected.to have_db_column(:longitude) }

  it { is_expected.to have_db_column(:in_use) }

  it { is_expected.to belong_to(:user) }

  it '\'in use\' defaults to be false' do
    user = User.create(name: 'Test',
                       email: 'test@test.com',
                       password: 'testtest',
                       password_confirmation: 'testtest')
    patch = described_class.create(location: 'SW11 4AE',
                                  patch_type: 'Window sill',
                                  duration: '1',
                                  user_id: user.id)
    expect(patch.in_use).to be false
  end

  it 'fetches coordinates when given a postcode' do
    subject.update(patch_type: 'Windowsill',
                   location: 'YO10 3DD', duration: '1')
    expect(subject.latitude).to eq(53.95503009999999)
    expect(subject.longitude).to eq(-1.0405632)
  end

  xit 'selects locations in a given radius' do
  end

end
