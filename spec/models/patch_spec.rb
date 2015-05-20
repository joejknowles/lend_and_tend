require 'spec_helper'

describe Patch, type: :model do
  it { is_expected.to have_db_column(:location) }
  it { is_expected.to have_db_column(:size) }
  it { is_expected.to have_db_column(:duration) }
end
