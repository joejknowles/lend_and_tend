require 'spec_helper'

describe Patch, type: :model do
  it { is_expected.to have_db_column(:location) }
  it { should validate_presence_of(:location) }

  it { is_expected.to have_db_column(:size) }
  it { should validate_presence_of(:size) }

  it { is_expected.to have_db_column(:duration) }
  it { should validate_presence_of(:duration) }
end
