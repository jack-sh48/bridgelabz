FactoryBot.define do
  factory :content_video, class: 'BxBlockContentManagement::ContentVideo' do
    # type { 'email_account' }
    name { "hi#{rand(100_000..999_999)} test" }
    url { "hi#{rand(100_000..999_999)} test" }
    description { "Lorem Ipsum is simply dummy text of the printing and typesetting industry." }
  end
end
