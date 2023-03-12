require 'rails_helper'
RSpec.describe BxBlockBanners::BannersController, type: :request do

  before :each do
     @file = fixture_file_upload('Screenshot from 2022-11-29 13-15-30.png')
  end

  before :each do
     @url = "/bx_block_banners/banners"
  end

  let (:create_banner){
    {
      "banners":  { "banner_title": "this is banner", "banner_description": "Banner Description", "submit_button_text": "Save" , "background_colour": "black" , "border_redius": 12.22, "border_width": 54.4, "border_colour": "red", "border": "last", "alignment": "left","image_logo": @file,"background_image": @file}
    }
  }

  let (:error_banner){
    {
      "banners": {"banner_description": "Banner Description", "submit_button_text": "Save" , "background_colour": "black" , "border_redius": 12.22, "border_width": 54.4, "border_colour": "red", "border": "last", "alignment": "left"}
    }
  }

  let (:update_banner){
    {
      'id': 1,
      "banners": { "page_title": "test", "page_description": "this last", "submit_button_text": "save" , "field_name": "text", "field_description": "lsksk", "field_type": "integer", "background_colour": "black" , "border_redius": "round", "border_width":  12.33, "border_colour": "red", "border": "thin", "alignment": "left"}
    }
  }

  describe "GET index" do
    it "renders the index template" do
      get @url, params: create_banner
      expect(response).to have_http_status 200
    end
  end

 describe 'Create Banner' do
    it 'should create Banner' do
      post @url, params: create_banner
      expect(response).to have_http_status 200
    end

    it 'Should Not Create ' do
       post @url, params: error_banner
       expect(response).to have_http_status 422
    end
 end

 describe 'Update Banner' do
  before do
      @banner = BxBlockBanners::Banner.find_by(id: 1)
      unless @banner
        @banner = BxBlockBanners::Banner.create( id: 1, alignment: "left", border: "solid", border_colour: "red", border_width: 12.333, background_colour: "black", position: nil, banner_title: "Login Form", banner_description: "this is testing", submit_button_text: "create", border_redius: 32.33)
      end
      @banner.logo_image=@file
      @banner.background_image=@file
      @banner.save
      @banner
    end
    it 'should update Banner' do
       put "/bx_block_banners/banners/1", params: update_banner
       expect(response).to have_http_status 200
    end

    it 'should not update Banner' do
       put "/bx_block_banners/banners/3", params: update_banner
       expect(response).to have_http_status 422
    end
 end

 describe 'Destroy Banner' do
    before do
      @banner = BxBlockBanners::Banner.find_by(id: 1)
      unless @banner
        @banner = BxBlockBanners::Banner.create( id: 1, alignment: "left", border: "solid", border_colour: "red", border_width: 12.333, background_colour: "black", position: nil, banner_title: "Login Form", banner_description: "this is testing", submit_button_text: "create", border_redius: 32.33)
      end
      @banner.logo_image=@file
      @banner.background_image=@file
      @banner.save
      @banner
    end
    it 'should delete Banner' do
       delete "/bx_block_banners/banners/1"
       expect(response).to have_http_status 200
    end
 end

 describe 'Show method' do
   it "should show Banner" do
     get "/bx_block_banners/banners", params: update_banner[:id]
     expect(response.status).to eq 200
  end
  it"should not show Banner" do
      get "/bx_block_banners/banners/0", params: error_banner[:id]
      expect(response).to have_http_status(404)
   end
 end

end
