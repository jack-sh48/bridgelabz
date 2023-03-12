require 'rails_helper'

RSpec.describe BxBlockStory::Company, type: :model do
  describe 'assocations' do
    it { should belong_to(:account).class_name('AccountBlock::Account')}
    it { should have_many(:testimonials).class_name('BxBlockStory::Testimonial')}
    it { should have_many(:stories).class_name('BxBlockStory::Story')}
  end
  
  describe 'validations' do
    it { should validate_presence_of(:description) }
  end
end
