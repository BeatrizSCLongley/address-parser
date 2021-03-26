json.array! @addresses do |address|
  json.extract! address, :id, :full_address, :street, :house_number, :postcode, :city, :country
end
