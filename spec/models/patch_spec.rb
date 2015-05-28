require 'spec_helper'
require 'rspec/active_model/mocks'

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

  it { is_expected.to have_many(:patch_images).dependent(:destroy) }

  let(:patch) do
    described_class.create(location: 'YO10 3DD',
                           patch_type: 'Windowsill', duration: '1')
  end

  it '\'in use\' defaults to be false' do
    stub_user = stub_model(User).as_new_record
    patch = described_class.create(location: 'SW11 4AE',
                                   patch_type: 'Window sill',
                                   duration: '1',
                                   user_id: stub_user.id)
    expect(patch.in_use).to be false
  end

  it 'fetches coordinates when given a postcode' do
    expect(patch.latitude).to eq(53.95503009999999)
    expect(patch.longitude).to eq(-1.0405632)
  end

  it 'selects locations in a given radius' do
    patch
    results = described_class.location_sort({ location: 'YO10 3PP' }, 10)
    expect(results.length).to eq 1
    expect(results.first.location).to eq 'YO10 3DD'
  end

  it "doesn't select locations outside given radius" do
    patch
    results = described_class.location_sort({ location: 'SW11 4AE' }, 10)
    expect(results).to be_empty
  end

  it 'returns whole relation if no location is given' do
    patch
    results = described_class.location_sort({}, 10)
    expect(results.first.location).to eq 'YO10 3DD'
    expect(results).to be described_class
  end

end