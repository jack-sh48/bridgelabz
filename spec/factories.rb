 FactoryBot.define do
  factory :bx_block_landingpage_scholarship, class: 'BxBlockLandingpage::Scholarship' do
    first_name { "MyString" }
    last_name { "MyString" }
    email { "MyString" }
    qualification { "MyString" }
    passout_year { "MyString" }
    mobile { "MyString" }
    experience { "MyString" }
    work_area { "MyString" }
  end

  factory :bx_block_banners_banner, class: 'BxBlockBanners::Banner' do
    alignment { "MyString" }
    border { "MyString" }
    border_colour { "MyString" }
    border_width { "MyString" }
    background_colour { "MyString" }
    background_image { "MyString" }
    position { "MyString" }
    banner_title { "MyString" }
    banner_description { "MyString" }
    submit_button_text { "MyString" }
    border_redius { "MyString" }
    logo_image { "MyString" }
  end

  factory :bx_block_address_address, class: 'BxBlockAddress::Address' do
    pin_code { "MyString" }
    address { "MyString" }
    city { "MyString" }
    country { "MyString" }
  end

  factory :bx_block_forms_form, class: 'BxBlockForms::Form' do
    image { "MyString" }
    page_title { "MyString" }
    page_description { "MyString" }
    submit_button_text { "MyString" }
    field_name { "MyString" }
    field_description { "MyString" }
    field_type { "MyString" }
    background_colour { "MyString" }
    border_redius { "MyString" }
    border_width { "MyString" }
    border_colour { "MyString" }
    border { "MyString" }
    alignment { "MyString" }
  end

  factory :bx_block_experiential_learning_experiential, class: 'BxBlockExperientialLearning::Experiential' do
    hours_of_coding { "MyString" }
    weeks_online_program { "MyString" }
    live_session { "MyString" }
    experienced_industry_expert { "MyString" }
  end

  factory :bx_block_faq_faq, class: 'BxBlockFaq::Faq' do
    description { "MyString" }
    question { "MyString" }
    content { "MyString" }
  end

  factory :bx_block_faqs_faq, class: 'BxBlockFaqs::Faq' do
    question { "MyString" }
    content { "MyString" }
    description { "MyString" }
  end

  factory :bx_block_teams_team, class: 'BxBlockTeams::Team' do
    name { "MyString" }
    position { "MyString" }
    descrption { "MyString" }
    linkedin_url { "MyString" }
    experience { 1 }
    image { "MyString" }
    designation { "MyString" }
  end

  factory :bx_block_team_team, class: 'BxBlockTeam::Team' do
    name { "MyString" }
    position { "MyString" }
    description { "MyString" }
    linkedin_url { "MyString" }
    experience { 1 }
    image { "MyString" }
    designation { "MyString" }
  end

  # factory :bx_block_faqs, class: 'BxBlockFaqs::Faq' do
  #   question { "MyString" }
  #   description { "MyString" }
  #   content { "MyString" }
  # end
 end
