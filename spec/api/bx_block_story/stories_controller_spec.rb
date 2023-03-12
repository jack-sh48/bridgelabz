require 'rails_helper'
require 'support/api_helper'
require 'spec_helper'

include ApiHelper
RSpec.describe BxBlockStory::StoriesController, type: :controller do
  before(:each) do
    @account = FactoryBot.create(:account)
    @company = FactoryBot.create(:companies, account_id: @account.id)
    @testimonial = FactoryBot.create(:testimonials, account_id: @account.id, company_id: @company.id )
    @testimonial1 = FactoryBot.create(:testimonials, account_id: @account.id, company_id: @company.id )
    @story = FactoryBot.create(:stories, account_id: @account.id, company_id: @company.id, testimonial_id: @testimonial.id)
    @token = authenticated_header(request, @account)
  end

  describe '#create' do 
    it 'should create success stories if data is present' do 
     params = { token: @token[:token], story: { name: 'text', position: 'devloper', package: '9 lakh', company_id: @company.id, testimonial_id: @testimonial.id, account_id: @account.id } } 
     post :create, params: params
     account = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end

    it 'should create success stories if data is present' do 
     params = { token: @token[:token], story: { name: 'texting', position: 'js', package: '10 lakh', company_id: @company.id, testimonial_id: @testimonial1.id, account_id: @account.id } } 
     post :create, params: params
     account = JSON.parse(response.body)
      expect(response).to have_http_status :created
    end

    it 'should not create success stories if data is not present' do 
     params = { token: @token[:token], story: { name: 'text', package: '9 lakh', company_id: 0, testimonial_id: 0, account_id: @account.id } } 
     post :create, params: params
     account = JSON.parse(response.body)
      expect(response).to have_http_status :not_found
    end
  end

  describe '#update' do 
    it 'should update success stories data' do 
      params = { token: @token[:token], id: @story.id, story: { position: 'devloper', description: 'this is de',  package: '10 lakh', company_id: @company.id, testimonial_id: @testimonial.id, account_id: @account.id}}
      put :update, params: params
      account = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end
  end

  describe '#destroy' do 
    it 'should update not success stories data' do 
      params = { token: @token[:token], id: @story.id }
      delete :destroy, params: params
      account = JSON.parse(response.body)
      expect(response).to have_http_status :ok
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
    it 'should show list of success stories' do 
      params = { token: @token, id: @story.id}
      get :show, params: params
      account = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end
  end

  describe '#destroy' do 
    it 'should delete success stories data' do 
      params = { token: @token[:token], id: @story.id }
      delete :destroy, params: params
      account = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end
  end
end