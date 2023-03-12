module BxBlockAddress
  class AddressController < ApplicationController

    def create
      @address = BxBlockAddress::Address.new(address_params)
      if @address.save
        render json: BxBlockAddress::AddressSerializer.new(@address, params: {url: request.base_url})
      else
        render json: {
            errors: [{
              error: "Address Not created!",
            }]
          }, status: :unprocessable_entity
       end
    end

    def update
      @address =  Address.find_by(id: params[:id])
      if @address&.update(address_params)
          render json: BxBlockAddress::AddressSerializer.new(@address, params: {url: request.base_url})
       else
         render json: {
              errors: [{
                error: "Address Not updated!",
              }]
            }, status: :unprocessable_entity
      end
    end

    def show
      @address =  Address.find_by(id: params[:id])
      unless @address.nil?
        render json: BxBlockAddress::AddressSerializer.new(@address, params: {url: request.base_url})
      else
        render json: {errors: [{message: "No record found"}]}, status: 404
      end
    end


    def address_params
       params.require(:address).permit(:pin_code, :city, :country, :address, :lat, :lng)
    end
  end
end
