class Api::V1::AddressesController < Api::V1::BaseController
  def index
    @addresses = Address.all
  end
end
