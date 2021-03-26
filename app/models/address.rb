class Address < ApplicationRecord
  validates :full_address, presence: true
end
