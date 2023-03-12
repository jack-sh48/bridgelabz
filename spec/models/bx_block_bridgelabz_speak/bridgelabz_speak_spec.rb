require 'rails_helper'

RSpec.describe BxBlockBridgelabzSpeak::BridgelabzSpeak, type: :model do
  describe 'has_many assocition' do
    it { should belong_to(:account).class_name('AccountBlock::Account') }
  end
  
  describe 'validations' do
    it { should validate_presence_of(:video) }
    it { should validate_presence_of(:title) }
    # it { should validate_presence_of(:password_confirmation) }
  end
end
