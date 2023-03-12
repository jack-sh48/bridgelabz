require 'rails_helper'
RSpec.describe BxBlockLandingpage::ScholarshipsController, type: :request do
  let (:create_scholarship){
    {
      "scholarship":
        {
            "first_name": "new",
            "last_name": "son",
            "email": "hello@gmail.com",
            "passout_year": 2019,
            "qualification": "MBA"
        }
    }
  }

  let (:error_scholarship){
    {
        "scholarship":
        {
            "first_name": "new",
            "last_name": "son",
            "passout_year": 2019,
            "qualification": "MBA"
        }
    }
  }

  let (:create_experience){
      {
        "scholarship":
        {
            "first_name": "test",
            "last_name": "son",
            "email": "hello@gmail.com",
            "passout_year": 2019,
            "qualification": "MBA",
            "mobile": 9876543210,
            "work_area": "new",
            "experience": 5
        }
    }
  }

  let (:error_experience){
      {
        "scholarship":
        {
            "first_name": "test",
            "last_name": "son",
            "passout_year": 2019,
            "qualification": "MBA",
            "mobile": 9876543210,
            "work_area": "new",
            "experience": 5
        }
    }
  }

 describe 'Create Scholarship' do
    it 'should create scholarships' do
      post "/bx_block_landingpage/scholarships/scholar", params: create_scholarship
      expect(response).to have_http_status 200
    end

    it 'Should Not Create' do
       post "/bx_block_landingpage/scholarships/scholar", params: error_scholarship
       expect(response).to have_http_status 422
    end
 end

  describe 'Create Experience' do
    it 'should create Experience' do
      post "/bx_block_landingpage/scholarships/experience", params: create_experience
      expect(response).to have_http_status 200
    end

    it 'Should Not Create' do
       post "/bx_block_landingpage/scholarships/experience", params: error_experience
       expect(response).to have_http_status 422
    end
 end
end
