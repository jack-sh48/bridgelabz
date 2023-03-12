require 'rails_helper'
RSpec.describe BxBlockNewsAboutUs::NewsAboutUsController, type: :request do
  before :each do
     @file = fixture_file_upload('Screenshot from 2022-11-29 13-15-30.png')
  end
  before :each do
     @url = "/bx_block_news_about_us/news_about_us"
  end
  let (:create_news_about){
    {
      "news_about_us": {
          "title": "Bridglabz my",
          "sub_title": "New video",
          "image": @file,
          "link": "link to",
          "content": "about to phyc",
          "description": "this is testing"
      }
    }
  }

  let (:error_news_about){
    {
      "news_about_us": {
          "title": "Bridglabz my",
          "sub_title": "New video",
          "link": "link to",
          "content": "about to phyc",
          "description": "this is testing"
      }
    }
  }

  let (:update_news_about){
    {
      'id': 6,
      "news_about_us": {
          "title": "Bridglabz my",
          "sub_title": "New video",
          "link": "link to",
          "content": "about to phyc",
          "description": "this is testing"
      }
    }
  }

  describe "GET index" do
    it "renders the index template" do
      get @url, params: create_news_about
      expect(response).to have_http_status 200
    end
  end

 describe 'Create News About Us' do
    it 'should create News About Us' do
      post @url, params: create_news_about
      expect(response).to have_http_status 200
    end

    it 'Should Not Create ' do
       post @url, params: error_news_about
       expect(response).to have_http_status 422
    end
 end

 describe 'Update News About Us' do
  before do
      @news_about = BxBlockNewsAboutUs::NewsAbout.find_by(id: 6)
      unless @news_about
        @news_about = BxBlockNewsAboutUs::NewsAbout.create(id: 6, title: "Bridglabz my", sub_title: "New video", link: "link to", content: "about to phyc", description: "this is testing")
      end
      @news_about.image=@file
      @news_about.save
      @news_about
    end
    it 'should update News About Us' do
       put "/bx_block_news_about_us/news_about_us/6", params: update_news_about
       expect(response).to have_http_status 200
    end

    it 'should not update News About Us' do
       put "/bx_block_news_about_us/news_about_us/7", params: update_news_about
       expect(response).to have_http_status 422
    end
 end

 describe 'Destroy News About Us' do
    before do
      @news_about = BxBlockNewsAboutUs::NewsAbout.find_by(id: 6)
      unless @news_about
        @news_about = BxBlockNewsAboutUs::NewsAbout.create(id: 6, title: "Bridglabz my", sub_title: "New video", link: "link to", content: "about to phyc", description: "this is testing")
      end
      @news_about.image=@file
      @news_about.save
      @news_about
    end
    it 'should delete News About Us' do
       delete "/bx_block_news_about_us/news_about_us/6"
       expect(response).to have_http_status 200
    end
 end


end
