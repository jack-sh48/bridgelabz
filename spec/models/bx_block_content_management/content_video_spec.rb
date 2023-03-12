require 'rails_helper'

RSpec.describe BxBlockContentManagement::ContentVideo, type: :model do
  describe 'has_many assocition' do
    it { should belong_to(:account).class_name('AccountBlock::Account')}
  end
  describe 'validations' do
    it { should validate_presence_of(:url) }
    it { should validate_presence_of(:name) }
    # it { should validate_presence_of(:password_confirmation) }
  end
end
