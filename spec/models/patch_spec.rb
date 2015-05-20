require 'spec_helper'

describe Patch, type: :model do
  it { is_expected.to have_db_column(:location) }
  it { is_expected.to validate_presence_of(:location) }
  it { is_expected.not_to allow_value('W8 9O').for(:location) }
  it { is_expected.to allow_value('WF14 3TS').for(:location) }

  it { is_expected.to have_db_column(:size) }
  it { is_expected.to validate_presence_of(:size) }

  it { is_expected.to have_db_column(:duration) }
  it { is_expected.to validate_presence_of(:duration) }
end
