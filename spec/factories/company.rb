require 'faker'
FactoryBot.define do
  factory :companies, class: 'BxBlockStory::Company' do
    # type { 'email_account' }
    company_name { "hi#{rand(100_000..999_999)} test" }
    subtitle { "hi#{rand(100_000..999_999)} test" }
    location { "hi#{rand(100_000..999_999)} test" }
    description { "Lorem Ipsum is simply dummy text of the printing and typesetting industry." }
    trait :with_attached_image do
      logo { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'bridgelabzz.png'), 'image/png') }
    end
  end
end
