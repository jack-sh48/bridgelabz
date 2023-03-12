require 'faker'
FactoryBot.define do
  factory :testimonials, class: 'BxBlockStory::Testimonial' do
    # type { 'email_account' }
    company_name { "hi#{rand(100_000..999_999)} test" }
    video_url { "hi#{rand(100_000..999_999)} test" }
    position { "hi#{rand(100_000..999_999)} test" }
    description { "Lorem Ipsum is simply dummy text of the printing and typesetting industry." }
  end
end
