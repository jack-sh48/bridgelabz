require 'rails_helper'
require 'support/api_helper'
require 'spec_helper'

include ApiHelper
RSpec.describe BxBlockBridgelabzSpeak::BridgelabzSpeaksController, type: :controller do
  before(:each) do
    @account = FactoryBot.create(:account)
    @bridgelabz_speak = FactoryBot.create(:bridgelabz_speaks, account_id: @account.id)
    @token = authenticated_header(request, @account)
  end

  describe '#create' do 
    it 'should create bridge lab speak if its video and title present' do 
     params = { token: @token[:token], bridgelabz_speak: { title: 'text', video: 'sfdfff', account_id: @account.id} } 
     post :create, params: params
     account = JSON.parse(response.body)
      expect(response).to have_http_status :created
    end

    it 'should not create company page if company name is empty' do 
     params = { token: @token[:token], bridgelabz_speak: { name: 'this is description'} }
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
    it 'should show list bridgelabz speak' do 
     params = { token: @token[:token], id: @bridgelabz_speak.id}
     get :show, params: params
     account = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end
  end

  describe '#update' do 
    it 'should update bridgelabz speak' do 
      params = { token: @token[:token], id: @bridgelabz_speak.id, bridgelabz_speak: {title: 'dummy', video: 'texture'}}
      put :update, params: params
      account = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end

    it 'should not update bridgelabz speak' do 
      params = { token: @token[:token], id: @bridgelabz_speak.id, bridgelabz_speak: { title: '', video: 'sfsfdsfd'}}
      put :update, params: params
      account = JSON.parse(response.body)
      expect(response).to have_http_status :unprocessable_entity
    end
  end

  describe '#destroy' do 
    it 'should update bridgelabz speak' do 
      params = { token: @token[:token], id: @bridgelabz_speak.id }
      delete :destroy, params: params
      account = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end
  end

end