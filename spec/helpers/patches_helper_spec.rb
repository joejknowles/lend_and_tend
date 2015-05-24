require 'rails_helper'

RSpec.describe PatchesHelper, type: :helper do
  it 'has an array of patch type options' do
    expect(patch_types_list).to be_an Array
  end
end
