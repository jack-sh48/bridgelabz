require 'rails_helper'

RSpec.describe BxBlockStory::Testimonial, type: :model do
  describe 'assocations' do
    it { should belong_to(:account).class_name('AccountBlock::Account')}
    it { should belong_to(:company).class_name('BxBlockStory::Company')}
  end

  describe 'validations' do
    it { should validate_presence_of(:company_name) }
  end
end
