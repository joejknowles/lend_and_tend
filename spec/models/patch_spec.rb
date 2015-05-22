require 'spec_helper'

describe Patch, type: :model do
  it { is_expected.to have_db_column(:location) }
  it { is_expected.to validate_presence_of(:location) }

  it { is_expected.to have_db_column(:patch_type) }
  it { is_expected.to validate_presence_of(:patch_type) }

  it { is_expected.to have_db_column(:duration) }
  it { is_expected.to validate_presence_of(:duration) }

  it { is_expected.to have_db_column(:description) }

  it { is_expected.to belong_to(:user) }

  it 'fetches coordinates when given a postcode' do
    subject.update(patch_type: 'Window sill', location: 'YO10 3DD', duration: '1')
    sleep 2
    expect(subject.latitude).to eq(53.95503009999999)
    expect(subject.longitude).to eq(-1.0405632)
  end

  xit 'selects locations in a given radius' do
  end
end
