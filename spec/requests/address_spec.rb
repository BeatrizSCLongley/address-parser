require 'rails_helper'

describe 'Addresses API', type: :request do
  it 'returns all addresses' do
    FactoryBot.create(:address, full_address: 'Julie-Wolfthorn-Straße 1, Berlin')
    FactoryBot.create(:address, full_address: 'Hermannstraße 158, 44263 DORTMUND-Hörde, Dortmund')

    get '/api/v1/addresses'

    # returns status code 200'
    expect(response).to have_http_status(:success)

    # returns books created
    expect(JSON.parse(response.body).size).to eq(2)
  end

  it 'creates an address' do
    # before running Post, there should be 0 instances & after 1
    expect {
      # version with basic geocoding:
      # post '/api/v1/addresses', params: { address: { full_address: 'Julie-Wolfthorn-Straße 1, Berlin' } }
      # version with google api:
      post '/api/v1/addresses', params: { full_address: 'Julie-Wolfthorn-Straße 1, Berlin' }
    }.to change { Address.count }.from(0).to(1)

    # returns status code 201'
    expect(response).to have_http_status(:created)
  end
end
