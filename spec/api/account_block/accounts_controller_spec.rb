require 'rails_helper'
require 'support/api_helper'
require 'spec_helper'

include ApiHelper
RSpec.describe AccountBlock::AccountsController, type: :controller do
  before(:each) do
    @account = FactoryBot.create(:account)
    @invalid_account = FactoryBot.create(:account, email: 'abc123')
    @token = authenticated_header(request, @account)
  end

  describe '#create' do
    it 'should create the @account with correct params' do
      params = { data: { type: 'email_account',
                         attributes: { first_name: @account.first_name, email: @account.email, full_phone_number: @account.full_phone_number,
                                       password: @account.password, user_type: @account.user_type } } }
      post :create, params: params
      account = JSON.parse(response.body)
      expect(response).to have_http_status :created
    end

    it 'should not create the @account with wrong email' do
      params = { data: { type: 'email_account',
                         attributes: { email: 'abc@gmail.com', user_type: nil } } }
      post :create, params: params
      account = JSON.parse(response.body)
      expect(response).to have_http_status :unprocessable_entity
    end

    it 'should not create the @account with invalid email' do
      params = { data: { type: 'email_account',
                         attributes: { email: 'abcgmail.com', user_type: nil } } } 
      post :create, params: params
      account = JSON.parse(response.body)
      expect(response).to have_http_status :unprocessable_entity
    end

    it 'should not create the @account with wrong email' do
      params = { data: { type: 'email',
                         attributes: { email: 'abc@gmail.com', user_type: nil } } } 
      post :create, params: params
      account = JSON.parse(response.body)
      expect(response).to have_http_status :unprocessable_entity
    end
  end

  describe '#index' do
    it 'show list of user' do
      get :index
      reference = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end
    it 'should not show list of user' do
      AccountBlock::Account.destroy_all
      get :index
      reference = JSON.parse(response.body)
      expect(response).to have_http_status :not_found
    end
  end

  describe '#destroy' do 
    it 'it should destroy user account' do
      params = { token: @token[:token], id: @account.id }
      delete :destroy, params: params
      reference = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end

    it 'it should not destroy user account' do
      AccountBlock::Account.destroy_all
      params = { token: nil, id: 0}
      delete :destroy, params: params
      reference = JSON.parse(response.body)
      expect(response).to have_http_status :not_found
    end
  end

  describe '#update' do
    it 'should update the @account with the given params' do
      AccountBlock::Account.destroy_all
      params = {token: @token[:token], id: 0 ,data: { account_id: rand(10_000..99_999), first_name: "abc#{rand(1_00 - 9_99)}", last_name: "xyz #{rand(1_00 - 9_99)}", email: "te#{rand(100_000..999_999)}@mailinator.com" }}
      put :update , params: params
      account = JSON.parse(response.body)
      expect(response).to have_http_status :unprocessable_entity
    end

    it 'should update the @account with the given params' do
      params = {token: @token[:token], id: @account.id ,account: { account_id: rand(10_000..99_999), first_name: "abc#{rand(1_00 - 9_99)}", last_name: "xyz #{rand(1_00 - 9_99)}", email: "te#{rand(100_000..999_999)}@mailinator.com", password: "abc#{rand(1_00 - 9_99)}" } }
      put :update , params: params
      account = JSON.parse(response.body)
      expect(response).to have_http_status :ok
    end
  end
end