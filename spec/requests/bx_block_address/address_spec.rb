require 'rails_helper'
RSpec.describe BxBlockAddress::AddressController, type: :request do
  let (:create_address){
    {
      "address": {
            "city": "indore",
            "pin_code": 451200,
            "country": "india",
            "address": "new testing",
            "lat": 23333.333,
            "lng": 129999.33
      }
    }
  }

  let (:error_address){
    {
      "address": {
        "city": "indore",
        "country": "india",
        "address": "new testing",
        "lat": 23333.333,
        "lng": 129999.33
      }
    }
  }

  let (:update_address){
    {
      'id': 1,
      "address": {
        "city": "indore",
        "pin_code": 451200,
        "country": "india",
        "address": "new testing",
        "lat": 23333.333,
        "lng": 129999.33
      }
    }
  }

 describe 'Create Address' do
    it 'should create Address' do
      post "/bx_block_address/address", params: create_address
      expect(response).to have_http_status 200
    end

    it 'Should Not Create ' do
       post "/bx_block_address/address", params: error_address
       expect(response).to have_http_status 422
    end
 end

 describe 'Update Address' do
  before do
      @address = BxBlockAddress::Address.find_by(id: 1)
      unless @address
        @address = BxBlockAddress::Address.new(id: 1, pin_code: 204600, address: "this is testing", city: "what is rails", country: "india", lat: 199999.222, lng: 18899999.22)
      end
      @address.save
      @address
    end
    it 'should update Address' do
       put "/bx_block_address/address/1", params: update_address
       expect(response).to have_http_status 200
    end
 end

 describe 'Show method' do
  before do
      @address = BxBlockAddress::Address.find_by(id: 1)
      unless @address
        @address = BxBlockAddress::Address.new(id: 1, pin_code: 204600, address: "this is testing", city: "what is rails", country: "india", lat: 199999.222, lng: 18899999.22)
      end
      @address.save
      @address
    end
   it "should show address" do
     get "/bx_block_address/address/1", params: update_address[:id]
     expect(response.status).to eq 200
  end
  it"should not show address" do
      get "/bx_block_address/address/0", params: update_address[:id]
      expect(response).to have_http_status(404)
   end
 end
end
