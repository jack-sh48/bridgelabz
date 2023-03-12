require 'rails_helper'
RSpec.describe BxBlockFaq::FaqController, type: :request do
  let (:create_faq){
    {
      "faq": {
          "question": "What is ruby",
          "content": "about to phyc",
          "description": "this is testing"
      }
    }
  }

  let (:error_faq){
    {
      "faq": {
          "description": "this is testing"
      }
    }
  }

  let (:update_faq){
    {
      'id': 1,
      "faq": {
          "question": "What is ruby",
          "content": "about to phyc",
          "description": "this is testing"
      }
    }
  }

 describe 'Create FAQs' do
    it 'should create FAQs' do
      post "/bx_block_faq/faq", params: create_faq
      expect(response).to have_http_status 200
    end

    it 'Should Not Create ' do
       post "/bx_block_faq/faq", params: error_faq
       expect(response).to have_http_status 422
    end
 end

 describe 'Update FAQ' do
  before do
      @faq = BxBlockFaq::Faq.find_by(id: 1)
      unless @faq
        @faq = BxBlockFaq::Faq.new(id: 1, content: "about to phyc", description: "this is testing", question: "what is rails")
      end
      @faq.save
      @faq
    end
    it 'should update FAQ' do
       put "/bx_block_faq/faq/1", params: update_faq
       expect(response).to have_http_status 200
    end
 end

 describe 'Destroy FAQs' do
    before do
      @faq = BxBlockFaq::Faq.find_by(id: 1)
      unless @faq
        @faq = BxBlockFaq::Faq.new(id: 1,content: "about to phyc", description: "this is testing",question: "what is rails")
      end
      @faq.save
      @faq
    end
    it 'should delete FAQs' do
       delete "/bx_block_faq/faq/1"
       expect(response).to have_http_status 200
    end
 end


end
