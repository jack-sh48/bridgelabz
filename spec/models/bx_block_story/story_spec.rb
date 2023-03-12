require 'rails_helper'

RSpec.describe BxBlockStory::Story, type: :model do
  describe 'assocations' do
    it { should belong_to(:company).class_name('BxBlockStory::Company')}
    it { should belong_to(:testimonial).class_name('BxBlockStory::Testimonial')}
    it { should belong_to(:account).class_name('AccountBlock::Account')}
  end
  
  describe 'validations' do
    it { should validate_presence_of(:position) }
  end
end
