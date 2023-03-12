require 'rails_helper'
require 'support/api_helper'
require 'spec_helper'

include ApiHelper
RSpec.describe BxBlockStory::CompaniesController, type: :controller do
  before(:each) do
    @account = FactoryBot.create(:account)
    @company = FactoryBot.create(:companies, account_id: @account.id)
    @token = authenticated_header(request, @account)
  end

  describe '#create' do 
    it 'should create company page if company name and its description present' do 
     params = { token: @token[:token], company: { company_name: 'text', description: 'this is description'} } 
     post :create, params: params
     account = JSON.parse(response.body)
      expect(response).to have_http_status :created
    end

    it 'should not create company page if company name is empty' do 
     params = { token: @token[:token], company: { name: 'this is description'} }
     post :create, params: params
     account = JSON.parse(response.body)
      expect(response).to have_http_status :unprocessable_entity
    end
  end

  describe '#index' do 
    it 'should show list of companies' do 
     params = { token: @token[:token] }
     get :index, params: params
     account = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end
  end

  describe '#show' do 
    it 'should show list of company' do 
     params = { token: @token[:token], id: @company.id}
     get :show, params: params
     account = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end
  end

  describe '#update' do 
    it 'should update company data' do 
      params = { token: @token[:token], id: @company.id, company: {company_name: 'dummy', description: 'texture'}}
      put :update, params: params
      account = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end
  end

  describe '#destroy' do 
    it 'should update company data' do 
      params = { token: @token[:token], id: @company.id }
      delete :destroy, params: params
      account = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end
  end
end