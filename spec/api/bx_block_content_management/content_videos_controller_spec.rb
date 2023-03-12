require 'rails_helper'
require 'support/api_helper'
require 'spec_helper'

include ApiHelper
RSpec.describe BxBlockContentManagement::ContentVideosController, type: :controller do
  before(:each) do
    @account = FactoryBot.create(:account)
    @video = FactoryBot.create(:content_video, account_id: @account.id)
    @token = authenticated_header(request, @account)
  end

  describe '#create' do
    it 'should create the @account with correct params' do
      params = { token: @token[:token], content_video: { id: @account.id, name: "abc#{rand(1_00 - 9_99)}", url: "abc#{rand(1_00 - 9_99)}" }}
      post :create, params: params
      account = JSON.parse(response.body)
      expect(response).to have_http_status :created
    end

    it 'should create the @account with correct params' do
      params = { token: @token[:token], content_video: { id: @account.id, url: "abc#{rand(1_00 - 9_99)}" }}
      post :create, params: params
      account = JSON.parse(response.body)
      expect(response).to have_http_status :unprocessable_entity
    end
  end

  describe '#index' do
    it 'show list of video' do
      params = { token: @token[:token] }
      get :index, params: params
      reference = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end
  end

  describe '#show' do
    it 'show specific content video' do
      params = { token: @token[:token], id: @video.id }
      get :show, params: params
      reference = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end
  end

  describe '#update' do
    it 'show update content video' do
      params = { token: @token[:token], id: @video.id, content_video: { name: "abc#{rand(1_00 - 9_99)}", url: "abc#{rand(1_00 - 9_99)}" } }
      put :update, params: params
      reference = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end
  end

  describe '#destroy' do
    it 'show update content video' do
      params = { token: @token[:token], id: @video.id }
      delete :destroy, params: params
      reference = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end
  end
end