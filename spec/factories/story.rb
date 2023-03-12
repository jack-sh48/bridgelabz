require 'faker'
FactoryBot.define do
  factory :stories, class: 'BxBlockStory::Story' do
    # type { 'email_account' }
    name { "hi#{rand(100_000..999_999)} test" }
    package { "hi#{rand(100_000..999_999)} test" }
    position { "hi#{rand(100_000..999_999)} test" }
    description { "Lorem Ipsum is simply dummy text of the printing and typesetting industry." }
    trait :with_attached_image do
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec', 'fixtures', 'bridgelabzz.png'), 'image/png') }
    end
  end
end
