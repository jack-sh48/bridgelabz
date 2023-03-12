require 'rails_helper'
RSpec.describe BxBlockExperientialLearning::ExperientialsController, type: :request do
  before do
    @url = '/bx_block_experiential_learning/experientials'
  end
  let (:create_experiential){
    {
      "experiential": {
          "hours_of_coding": 3,
          "weeks_online_program": 17,
          "live_session": 45.00,
          "experienced_industry_expert": "1:10"
      }
    }
  }

  let (:error_experiential){
    {
      "experiential": {
          "weeks_online_program": 17,
          "live_session": 45.00,
          "experienced_industry_expert": "1:10"
      }
    }
  }

  let (:update_experiential){
    {
      'id': 1,
      "experiential": {
          "hours_of_coding": 3,
          "weeks_online_program": 17,
          "live_session": 45.00,
          "experienced_industry_expert": "1:10"
      }
    }
  }

  describe "GET index" do
    it "renders the index template" do
      get @url, params: create_experiential
      expect(response).to have_http_status 200
    end
  end

 describe 'Create Experiential' do
    it 'should create Experiential' do
      post @url, params: create_experiential
      expect(response).to have_http_status 200
    end

    it 'Should Not Create ' do
       post @url, params: error_experiential
       expect(response).to have_http_status 422
    end
 end

 describe 'Update FAQ' do
  before do
      @experiential = BxBlockExperientialLearning::Experiential.find_by(id: 1)
      unless @experiential
        @experiential = BxBlockExperientialLearning::Experiential.new(id: 1, hours_of_coding: 8, weeks_online_program: 65, live_session: 45.50, experienced_industry_expert: "2:32")
      end
      @experiential.save
      @experiential
    end
    it 'should update FAQ' do
       put "/bx_block_experiential_learning/experientials/1", params: update_experiential
       expect(response).to have_http_status 200
    end
 end

 describe 'Destroy Experiential' do
    before do
      @experiential = BxBlockExperientialLearning::Experiential.find_by(id: 1)
      unless @experiential
        @experiential = BxBlockExperientialLearning::Experiential.new(id: 1, hours_of_coding: 8, weeks_online_program: 65, live_session: 45.50, experienced_industry_expert: "2:32")
      end
      @experiential.save
      @experiential
    end
    it 'should delete Experiential' do
       delete "/bx_block_experiential_learning/experientials/1"
       expect(response).to have_http_status 200
    end
 end
end
