require 'rest-client'

class AddressCreator
  def self.parse_address(full_address)
    url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{URI.encode(full_address)}&key=#{ENV['GOOGLE_API_SERVER_KEY']}"
    geo_data = JSON.parse(RestClient.get(url, { accept: :json }))

    # variables created outside block to reasign on iteration
    # and finaly assign to instance variables of address
    street = nil
    house_number = nil
    postcode = nil
    city = nil
    country = nil

    # Iterate over JSON to retrieve the right values for each variable
    address_components = geo_data['results'][0]['address_components']

    address_components.each do |component|
      if component['types'] == ['route']
        street = component['long_name']
      elsif component['types'] == ['street_number']
        house_number = component['long_name']
      elsif component['types'] == ['postal_code']
        postcode = component['long_name']
      elsif component['types'] == ['locality', 'political']
        city = component['long_name']
      elsif component['types'] == ['country', 'political']
        country = component['long_name']
      end
    end

    # instance variables to create the addresses
    {
      full_address: full_address,
      street: street,
      house_number: house_number,
      postcode: postcode,
      city: city,
      country: country
    }
  end
end
