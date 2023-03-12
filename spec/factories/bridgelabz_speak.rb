require 'faker'
FactoryBot.define do
  factory :bridgelabz_speaks, class: 'BxBlockBridgelabzSpeak::BridgelabzSpeak' do
    # type { 'email_account' }
    title { "hi#{rand(100_000..999_999)} test" }
    subtitle { "hi#{rand(100_000..999_999)} test" }
    video { "hi#{rand(100_000..999_999)} test" }
    description { "Lorem Ipsum is simply dummy text of the printing and typesetting industry." }
    trait :with_attached_image do
      bridgelabz_speak_image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'bridgelabzz.png'), 'image/png') }
    end
  end
end
