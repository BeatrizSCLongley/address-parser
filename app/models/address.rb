class Address < ApplicationRecord
  # :full_address, :street, :house_number, :postcode, :city, :country
  validates :full_address, presence: true

  # First stage - basic functionality using geocoding gem:
  # geocoded_by :full_address do |obj, results|
  #   if geo = results.first
  #     obj.street = geo.address
  #     obj.house_number = geo.house_number
  #     obj.postcode = geo.postal_code
  #     obj.city = geo.city
  #     obj.country = geo.country
  #   end
  # end
  # after_validation :geocode
end
