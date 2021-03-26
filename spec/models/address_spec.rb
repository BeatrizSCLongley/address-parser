require 'rails_helper'

RSpec.describe Address, type: :model do
  let(:address) do
    Address.new(full_address: 'Julie-Wolfthorn-Straße 1, Berlin')
  end

  it 'is valid with valid attributes' do
    expect(address).to be_valid
  end

  it 'is not valid without a full_address' do
    address.full_address = nil
    expect(address).to_not be_valid
  end

  it 'is not valid if given an empty string' do
    address.full_address = ' '
    expect(address).to_not be_valid
  end
end
