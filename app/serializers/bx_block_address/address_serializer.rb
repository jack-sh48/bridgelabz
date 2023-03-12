module BxBlockAddress
  class AddressSerializer < BuilderBase::BaseSerializer

    attribute :address_data do |object, params|
      address_for(object, params)
    end

    private
    class << self
      def address_for(object, params)
          { id: object.id, pin_code: object.pin_code, address: object.address, city: object.city, country: object.country, lat: object.lat, lng: object.lng}
      end
    end
  end
end
