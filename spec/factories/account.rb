FactoryBot.define do
  factory :account, class: 'AccountBlock::Account' do
    # type { 'email_account' }
    last_name { "hi#{rand(100_000..999_999)} test" }
    first_name { "hi#{rand(100_000..999_999)} test" }
    email { "te#{rand(100_000..999_999)}@mailinator.com" }
    password { '123456' }
    activated { true }
  end
end
