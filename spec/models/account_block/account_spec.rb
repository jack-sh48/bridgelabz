require 'rails_helper'

RSpec.describe AccountBlock::Account, type: :model do
  describe 'has_many assocition' do
    it { should have_many(:content_videos).class_name('BxBlockContentManagement::ContentVideo') }
    it { should have_many(:companies).class_name('BxBlockStory::Company') }
   	it { should have_many(:testimonials).class_name('BxBlockStory::Testimonial') }
    it { should have_many(:bridgelabz_speaks).class_name('BxBlockBridgelabzSpeak::BridgelabzSpeak') }
  end
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
    # it { should validate_presence_of(:password_confirmation) }
  end
end
