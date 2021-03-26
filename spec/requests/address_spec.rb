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
end
