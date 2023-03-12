require 'rails_helper'
require 'support/api_helper'
require 'spec_helper'

include ApiHelper
RSpec.describe BxBlockStory::TestimonialsController, type: :controller do
  before(:each) do
    @account = FactoryBot.create(:account)
    @company = FactoryBot.create(:companies, account_id: @account.id)
    @testimonial = FactoryBot.create(:testimonials, account_id: @account.id, company_id: @company.id )
    @token = authenticated_header(request, @account)
  end

  describe '#create' do 
    it 'should create testimonial if company id and account id is present' do 
     params = { token: @token[:token], testimonial: { company_name: 'text', description: 'this is description',account_id: @account_id, company_id: @company.id} } 
     post :create, params: params
     account = JSON.parse(response.body)
      expect(response).to have_http_status :created
    end

    it 'should not create testimonial if company id and account id is present' do 
     params = { token: @token[:token], testimonial: { description: 'this is description'} }
     post :create, params: params
     account = JSON.parse(response.body)
      expect(response).to have_http_status :unprocessable_entity
    end
  end

  describe '#index' do 
    it 'should show list of testimonial' do 
     params = { token: @token[:token] }
     get :index, params: params
     account = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end
  end

  describe '#show' do 
    it 'should show list of company' do 
     params = { token: @token[:token], id: @testimonial.id}
     get :show, params: params
     account = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end
  end

  describe '#update' do 
    it 'should update company data' do 
      params = { token: @token[:token], id: @testimonial.id, testimonial: {company_name: 'dummy', description: 'texture', name: 'tata'}}
      put :update, params: params
      account = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end
  end

  describe '#destroy' do 
    it 'should update company data' do 
      params = { token: @token[:token], id: @testimonial.id }
      delete :destroy, params: params
      account = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end
  end
end