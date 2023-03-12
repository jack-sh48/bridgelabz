require 'rails_helper'
RSpec.describe BxBlockTeams::TeamsController, type: :request do
  before :each do
     @file = fixture_file_upload('Screenshot from 2022-11-29 13-15-30.png')
  end
  let (:create_employee){
    {
      "teams": {
            "name": "jack",
            "position": "Manager",
            "linkedin_url": "https/localhost:3000",
            "experience": "5",
            "image": @file,
            "description": "this is new",
            "designation": "MBA"
      }
    }
  }

  let (:error_employee){
    {
      "teams": {
          "title": "Bridglabz my",
          "sub_title": "New video",
          "link": "link to",
          "content": "about to phyc",
          "description": "this is testing"
      }
    }
  }

  let (:update_employee){
    {
      'id': 4,
      "teams": {
            "name": "jack",
            "position": "Manager",
            "linkedin_url": "https/localhost:3000",
            "experience": "5",
            "description": "this is new",
            "designation": "MBA"
      }
    }
  }

 describe 'Create Employee' do
    it 'should create Employee' do
      post "/bx_block_teams/teams", params: create_employee
      expect(response).to have_http_status 200
    end

    it 'Should Not Create ' do
       post "/bx_block_teams/teams", params: error_employee
       expect(response).to have_http_status 422
    end
 end

 describe 'Update Employee' do
  before do
      @employee = BxBlockTeams::Team.find_by(id: 4)
      unless @employee
        @employee = BxBlockTeams::Team.create({id: 4, name: "jack", position: "Manager", linkedin_url: "https/github.com", experience: "5", description: "hello", designation: "MBA"})
      end
      @employee.image=@file
      @employee.save
      @employee
    end
    it 'should update Employee' do
       put "/bx_block_teams/teams/4", params: update_employee
       expect(response).to have_http_status 200
    end
 end

 describe 'Destroy Employee' do
    before do
      @employee = BxBlockTeams::Team.find_by(id: 4)
      unless @employee
        @employee = BxBlockTeams::Team.create({id: 4, name: "jack", position: "Manager", linkedin_url: "https/facebook.com", experience: "5", description: "hey guys", designation: "MBA"})
      end
      @employee.image=@file
      @employee.save
      @employee
    end
    it 'should delete Employee' do
       delete "/bx_block_teams/teams/4"
       expect(response).to have_http_status 200
    end
 end


end
