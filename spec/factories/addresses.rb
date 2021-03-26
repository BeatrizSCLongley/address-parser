FactoryBot.define do
  factory :address do
    full_address { "MyString" }
    street { "MyString" }
    house_number { "MyString" }
    postcode { "MyString" }
    city { "MyString" }
    country { "MyString" }
    latitude { 1.5 }
    longitude { 1.5 }
  end
end
